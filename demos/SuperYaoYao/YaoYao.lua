function YaoYaoNearUsers(username,key,x,y)
	--Ҫ��¼�û�����ҡ��������Ϊ�˼���ʡ������֤key�Ĺ���
	
	local bizR = GetRuntimeFromGroup("SuperYaoYao.Biz")
	return bizR:call(function(name,gpsx,gpsy)
		local now = time()
		local r = GetCurrentRuntime()
		local usertable = r:GetRuntimeState("SuperYaoYao.UserPostion")
		usertable[name] = {x=gpsx,y=gpsy,updatetime=now}
		
		local bizRList = GetRuntimeListFromGroup("SuperYaoYao.Biz")
		local rlist = {}
		for i,v in pairs(bizRList) do
			--�������߼�����Ҫ����ͬʱ�����ѯ,�������ǿ����bizRList�����Runtime��˳��:����ȴ���һ��call���ؽ���˲Ż�call��һ��
			-- ����������Ҫasyn_call ���߼�����Ҳ����Ҫͬʱ֧��call,asyncall��
			result,ulist = v:call(function(cx,cy)
				local utable = GetCurrentRuntime():GetRuntimeState("SuperYaoYao.UserPostion")
				--Runtime״̬�ļ����ӿڣ������þ����select������߼����塣������Ż����ܵĽǶ���˵����Ҫ���ݲ�ѯ�����������Ż�������������ÿ�ζ�Ҫ�����е�runtime�ж���̫����
				--����������̣�Ҳ������Լ�����GetCurrentRuntime():call �ĵ��ã��൱��Ͷ����һ��asyncall? 
				local users = utalbe:Select("select name where distance(cx,cy,x,y) < 10 and time()-updatetime < 10")
				return 0,users
			end,gpsx,gpsy)
			
			if result == 0 then
				rlist:append(ulist)
			end
		end
		
		return 0,rlist
	end,username,x,y)
end

function YaoYaoNearUsersUseAsynCall(username,key,x,y)
	local bizR = GetRuntimeFromGroup("SuperYaoYao.Biz")
	return bizR:call(function(name,gpsx,gpsy)
		local now = time()
		local r = GetCurrentRuntime()
		
		local usertable = r:GetRuntimeState("SuperYaoYao.UserPostion")
		usertable[name] = {x=gpsx,y=gpsy,updatetime=now}
		
		local bizRList = GetRuntimeListFromGroup("SuperYaoYao.Biz")
		local rlist = {}
		local total = #bizRList
		--��ͬһ�������е�����λ�õ���GetCurrentCodeFrame()���᷵��ͬһ������
		local cf = GetCurrentCodeFrame()
		
		for i,v in pairs(bizRList) do
			result,ulist = v:asyncall(function(cx,cy)
				local utable = GetCurrentRuntime():GetRuntimeState("SuperYaoYao.UserPostion")
				--Runtime״̬�ļ����ӿڣ������þ����select������߼�����
				--����������̣�Ҳ������Լ�����GetCurrentRuntime():call �ĵ��ã��൱��Ͷ����һ��asyncall? 
				local users = utalbe:Select("select name where distance(cx,cy,x,y) < 10 and time()-updatetime < 10")
				return 0,users
			end,function (result,ulist)
				total = total - 1
				if result == 0 then
					rlist:append(ulist)
				end
				
				if total == 0 then
					--���ﲻ����GetCurrentCodeFrame():resume()
					--�����codeframe�Ѿ��뱣���code frame��ͬ��
					cf:resume()
				end
			end,gpsx,gpsy)
		end
		
		--����asyncall����Ҫ�ֹ���codeframe��Ϊ����״̬
		cf:yield()
		
		return 0,rlist
	end,username,x,y)
end
#Runtime

����ʹ��һ���ַ�������ʾRuntime�������ַ,����ַ����ĺ�����Runtime��ʵ���߶���
�õ�һ��Runtime����󣬿��Ի�ȡ������
runtime��sandbox���Կ���������������ȡ
runtime�ķ�sandbox����ֻ������runtime�����е�code frame���ȡ


Runtime��״̬��Ϊ δ����->������->�ȴ�->����->�ر���
�ȴ�״̬��Runtimeû�������κ�CodeFrame������״̬��Runtime��������һ��ȷ����Code Frame

Code Frame���ջᱻ������Ҳ������;������
һ��������CodeFrame�ᵼ�¸�CodeFrame������
��һ��Runtiime�ϵ�����CodeFrame�����ڹ���״̬���򲻰����κ�CodeFrameʱ����Runtime���ڵȴ�״̬
һ��codeframe���뾡��������/�������κ�codeframe������һ��ִ�й�����ʱ��

Runtime�����¼�������ܴӵȴ�״̬��Ϊ����״̬
1.һ�����ĵ��¼������ˣ������и��¼���һ����Ӧ����
2.�û�Ҫ��Runtime��һ��startupLink,Runtime�᳢������startLink��Ӧ��Sub
3.���RuntimeͶ��һ��Sub����Runtime����
4.CodeFrame�ӹ���״̬��Ϊ����״̬���������ͨ�������� ����ģ�� �㶨)

#Event
Event��Ϊ�����¼����û��Զ����¼�
��Event����ʱ��Runtime���Event�Ĵ�������װ��һ��CodeFrame������Runtime�Ĵ�ִ�ж���

��Runtime�����µ����������������µ������¼��������¼��ı߽�ͨ��ֻ������һ��Runtime��
��Runtime����ģ�飬���������µ��û��Զ����¼����û��Զ����¼��ı߽����������App��Χ

#Sub 
result,function,subresults = Runtime.call(sub,args...)  --����
����������,sub����һ��function����ʵ���ϣ����������ܵ����Ƶģ������upvalueֻ��ͨ��ֵ�ķ�ʽֻ������.���������������ͬ�����⣩
��sub�Ĵ����У�����ʹ��GetCurrentRuntime()��õ�ǰ��Runtime��ͨ��GetCallerRuntime()���Ͷ��Sub��ԴRuntime
Runtimie.call�ķ���ֵ��ǰ�����ǹ̶��ġ� result��ʾ���β����Ľ�������ֵ��Ϊ0���������׵���ʧ�ܵ�ԭ��function��ʾsub����ɲ�����CallerRuntime������







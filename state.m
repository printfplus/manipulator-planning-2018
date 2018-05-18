classdef state
    properties
        IO;
        Pre;
        Buffer;
        Post;
        P1;
        P2;
        P3;
        P4;
        P5;
        P6;
        R1;
        R2;
    end

    methods    
        function obj = state(obj,args)
            %参数如下：
            %0:空闲
            %1:有产品A
            %2:有产品B
            %3:有产品C
            %4:有产品D
            longnum = 40000;
            obj.IO = zeros(1,longnum);
            obj.Pre = zeros(1,longnum);
            obj.Buffer = zeros(1,longnum);
            obj.Post = zeros(1,longnum);
            obj.P1 = zeros(1,longnum);
            obj.P2 = zeros(1,longnum);
            obj.P3 = zeros(1,longnum);
            obj.P4 = zeros(1,longnum);
            obj.P5 = zeros(1,longnum);
            obj.P6 = zeros(1,longnum);
            obj.R1 = cell(1,longnum);
            obj.R2 = cell(1,longnum);
        end

        function obj = set_action(obj,new_action)
            action_begin_time = new_action.begin_time;
            agent = new_action.action_agent;
            agent_status = get_status(agent,action_begin_time);
            if agent_status == new_action.begin_point;



        end

        function status = get_status(obj,agent,time)
            if agent == 'R1'
                status = obj.R1(time);
            elseif agent == 'R2'
                status = obj.R2(time);
            end
        end

        function obj = set_agent_status(obj,agent,begin_time,end_time)
            if agent == 'R1'
                obj.R1(begin_time:end_time) = 



    end


end
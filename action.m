classdef action

    properties
        begin_point;
        finish_point;
        action_agent;
        action_time;
        R1_action_list;
        R2_action_list;
        begin_time;
        finish_time;
    end

    methods
        function obj = action(action_agent,begin_point,finish_point,begin_time)
            obj.begin_point = begin_point;
            obj.finish_point = finish_point;
            obj.action_agent = action_agent;
            obj.R1_action_list = {'Pre','Buffer','Post','IO'};
            obj.R2_action_list = {'Buffer','P1','P2','P3','P4','P5','P6'};
            obj.action_time = 0;
            obj.action_time = obj.calculate_time();
            obj.begin_time = begin_time;
            obj.finish_time = begin_time+obj.action_time;         
        end

        function time = calculate_time(obj)
            begin_point_tmp = obj.begin_point;
            finish_point_tmp = obj.finish_point;
            if strcmp(obj.action_agent,'R1')
                action_list = obj.R1_action_list;
            elseif strcmp(obj.action_agent,'R2')
                action_list = obj.R2_action_list;
            else 
                if ismember(begin_point_tmp,obj.R1_action_list)
                    R1_action = action('R1',obj.begin_point,'Buffer')
                    R2_action = action('R2','Buffer',obj.finish_point);
                    time = R1_action.action_time+R2_action.action_time;
                else
                    R2_action = action('R2',obj.begin_point,'Buffer');
                    R1_action = action('R1','Buffer',obj.finish_point);
                    time = R1_action.action_time+R2_action.action_time;
                end
                return;
            end
            [~,begin_num] = ismember(begin_point_tmp,action_list);
            [~,finish_num] = ismember(finish_point_tmp,action_list);
            if finish_num >= begin_num
                move_time = finish_num-begin_num;
            else
                move_time = finish_num+size(obj.R1_action_list)-begin_num;
            end
            time = move_time+2;
        end

        function display_member(obj)
            fprintf('action_agent:%s\n',obj.action_agent);
            fprintf('begin_point:%s\n',obj.begin_point);
            fprintf('finish_point:%s\n',obj.finish_point);
            fprintf('begin_time:%d\n',obj.begin_time);
            fprintf('action_time:%d\n',obj.action_time);
            fprintf('finish_time:%d\n',obj.finish_time);
        end
    end
end

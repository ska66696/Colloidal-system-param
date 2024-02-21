function [parts] = frame_cropping(parts,start_frame,end_frame)

parts = parts(start_frame : end_frame);
if length(parts{1}(1,:)) == 3
for i = 1 : length(parts)
    parts{i}(:,3)=[];
end
end

% for i=start_frame:end_frame
%     parts{i}(:,3)=[];
%     %     plot(parts{i}(:,1),parts{i}(:,2),'ro')
%     %     parts{i}(parts{i}(:,1)<= 400,:)=[];
%     %     parts{i}(parts{i}(:,1)>= 2800,:)=[];
%     %     parts{i}(:,1)=parts{i}(:,1)-400;
% 
%     %     parts{i}(parts{i}(:,1)<= 700,:)=[];
%     %     parts{i}(parts{i}(:,1)>= 2800,:)=[];
%     %     parts{i}(:,1)=parts{i}(:,1)-700;
%     %     parts{i}(parts{i}(:,2)<= 200,:)=[];
%     %     parts{i}(parts{i}(:,2)>= 2300,:)=[];
%     %     parts{i}(:,2)=parts{i}(:,2)-200;
% 
%     %     plot(parts{i}(:,1),parts{i}(:,2),'ro')
%     %     parts{i}(parts{i}(:,1)<= 400,:)=[];
%     %     parts{i}(parts{i}(:,1)>= 2800,:)=[];
%     %     parts{i}(:,1)=parts{i}(:,1)-400;
%     %     parts{i}(parts{i}(:,2)<= 400,:)=[];
%     %     parts{i}(parts{i}(:,2)>= 2200,:)=[];
%     %     parts{i}(:,2)=parts{i}(:,2)-400;
%     %     plot(parts{i}(:,1),parts{i}(:,2),'ro')
% end
end


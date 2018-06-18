function [path]= BFS(Graph,sourceNode, destinationNode)

exploredList=[sourceNode,0]' % node and its parent
frontier= [sourceNode,0]' % node and its parent
[rows,columns]=size(Graph)
currentExplored=[sourceNode,0]' % node and its parent

while 1
    % add all adjecent nodes of currently explored node to frontier
               %(if the adj node is has not been explored or is not in frontier already)
    for i=1: columns
       if Graph(currentExplored(1,1), i)==1
           if (any(frontier(1,:)==i)==0 && any(exploredList(1,:)==i)==0)
               frontier=[frontier,[i,currentExplored(1,1)]']
           end           
       end
    end  
       
   %remove the explored node fron frontier and place in exploredList 
   exploredList=[exploredList,frontier(:,1)]
   frontier=frontier(:,[2:size(frontier',1)])
   
    % if explored node was destination terminate
   if (currentExplored(1,1) == destinationNode)
      break
   end
   currentExplored=frontier(:,1)
end

% Back track the path
path='NA'
find(exploredList(1,:)==destinationNode)
if (any(exploredList(1,:)==destinationNode)~=0)
     parent=exploredList(2,find(exploredList(1,:)==destinationNode))
     path=destinationNode
     while (parent~=0)
        path=[parent,path]
        parent=exploredList(2,find(exploredList(1,:)==parent))
     end   
end




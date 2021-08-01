function Output = Normalization(Input)
FlattenedData = Input(:)'; 
MappedFlattened = mapminmax(FlattenedData, 0, 1); 
Output = reshape(MappedFlattened, size(Input));
end


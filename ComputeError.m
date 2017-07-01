function[error] = ComputeError(pnts_gt,pnts_computed)
  error = sum(sqrt(sum((pnts_gt(:,1:2) - pnts_computed(:,1:2)).^2,2)));
end


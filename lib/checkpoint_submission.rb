module CheckpointSubmission
  def create_submission(assignment_branch, assignment_commit_link, checkpoint_id, comment, enrollment_id)
    self.class.post("https://www.bloc.io/api/v1/checkpoint_submissions", body: { assignment_branch: assignment_branch, assignment_commit_link: assignment_commit_link, checkpoint_id: checkpoint_id, comment: comment, enrollment_id: enrollment_id }, headers: { "authorization" => @authorization_token} )
  end
end
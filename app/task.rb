get "/add_task" do
        @task = Task.new
        erb :"task/add"
end

post "/add_task" do
        @task = Task.new(params[:task])
        if @task.save
	        "Successfully added the task"
        else
		"The Task already Exist"
        end
end


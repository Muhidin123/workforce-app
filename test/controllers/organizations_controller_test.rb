require "test_helper"

class OrganizationsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @organization = organizations(:one)

    #we can create new user or use one of the users from fixture
    # user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd', :name => "User")
    # login_as(user, :scope => :user)
    login_as(users(:one), :scope => :user)
  end
  
  test "should get index" do
    get '/organizations'
    assert_response :success
  end


  test "should get new" do
    get new_organization_url
    assert_response :success
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post organizations_url, params: { organization: { hourly_rate: @organization.hourly_rate, name: @organization.name } }
    end
    assert_redirected_to root_path
  end

    #test will fail because in routes.rb route is prohibited from visiting
  # test "should show organization" do
  #   get organization_url(@organization)
  #   assert_response :success
  # end

  test "should get edit" do
    get edit_organization_url(@organization)
    assert_response :success
  end


  test "should update organization" do
    patch organization_url(@organization), params: { organization: { hourly_rate: @organization.hourly_rate, name: @organization.name } }
    assert_redirected_to root_path
  end


  #users will not be able to destroy organizations when using application
  # test "should destroy organization" do
  #   assert_difference('Organization.count', -1) do
  #     delete organization_url(@organization)
  #   end
  #   assert_redirected_to organizations_url
  # end
end
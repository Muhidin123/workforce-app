class ShiftsHelperTest< ActionView::TestCase
    test "Should return correct time format" do
        time = DateTime.parse("Wed, 05 May 2021 14:00:00.000000000 UTC +00:00")
        assert_equal("05/05/2021 at 02:00PM", convert_time(time))
    end 
end
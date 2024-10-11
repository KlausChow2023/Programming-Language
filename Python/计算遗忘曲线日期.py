from datetime import datetime, timedelta

def calculate_future_dates(input_date):
    # 将输入的日期字符串转换为datetime对象
    date_format = "%Y-%m-%d"
    input_datetime = datetime.strptime(input_date, date_format)

    # 计算不同间隔时间后的日期
    intervals = [1, 2, 4, 7, 15, 30, 90, 180]  # 分别对应1天、2天、4天、7天、15天、1个月、3个月、6个月

    future_dates = {}
    for interval in intervals:
        future_date = input_datetime + timedelta(days=interval)
        future_dates[interval] = future_date.strftime(date_format)

    return future_dates

while 1:

    if __name__ == "__main__":
        input_date = input("请输入一个日期（格式为YYYY-MM-DD）：")
        i = 0
        try:
            future_dates = calculate_future_dates(input_date)
            print("输入日期：", input_date)
            for interval, date in future_dates.items():
                i += 1
                print(f"{interval}天后第{i}次复习的日期：", date)

        except ValueError:
            print("日期格式错误，请输入正确的日期格式（YYYY-MM-DD）。")

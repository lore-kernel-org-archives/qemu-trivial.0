Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPAsP-0000tM-Op
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jan 2016 10:22:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aPAsM-0000rZ-73
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 10:22:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aPAsI-0002fn-Vx
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 10:22:18 -0500
Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234]:34282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aPAsI-0002fb-KO
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 10:22:14 -0500
Received: by mail-pa0-x234.google.com with SMTP id uo6so43663172pac.1
	for <qemu-trivial@nongnu.org>; Fri, 29 Jan 2016 07:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=R7rylsNbuGPWfVsgsGqn66ERmR178f+c7GOk/jObL9E=;
	b=fhn8dtQEv10GuYJFJhdGB4MGGI86m7869WOT2jelVCKQB09zeCWXRmhWVTMDFlanMV
	s17P7U9jaKKMnFoCcqoFgwqNM1ZBbT3F4J42xwwmyqp42RZLb0dmelNNTpZEdQBv6BHv
	AP+v5OX+TfDbTOs5OdQBadEbsqUmTQIBfIRfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=R7rylsNbuGPWfVsgsGqn66ERmR178f+c7GOk/jObL9E=;
	b=jxLoHroXdcFC0pGzoh16A2BLNNdSs9ZEP1mic6b2j2W0kJoq9p48OUeXl625/zSbDN
	LLQVM4/THxFasIV4VlzkuW0J6LtbtQu74vqgabWBQseKx7JBqRGnTperYv/zD8e8JKY2
	JQKZSQVFaa+cyZnZ9AssX2sttUhD1CJYjkGBmr/s7hqLmmGQieOdv/7YSU+HoDJjI0qw
	nCSgF5BKcAviOpVB32QMZk6tXxQQ7hH8EZHs7ZDvWHenWNgWxCX/yYIabnWQdOZ8sjiQ
	jy2RdytGqp5vxp3mgbsZ8K5sT8o89K+zXqOBSRBUyHU885uygi9tSd9CmjdoPQO64LN1
	TC4w==
X-Gm-Message-State: AG10YORRj3lErvmIkE4oFROpxg1agV0NvuNFq8TTVai0rSvF5SL1RmLSu4JygITtRAsKPb07
X-Received: by 10.66.142.73 with SMTP id ru9mr14090956pab.121.1454080933864;
	Fri, 29 Jan 2016 07:22:13 -0800 (PST)
Received: from [10.15.245.110] ([167.160.116.223])
	by smtp.googlemail.com with ESMTPSA id
	dg1sm24322665pad.18.2016.01.29.07.22.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jan 2016 07:22:12 -0800 (PST)
Message-ID: <56AB83BB.8040504@linaro.org>
Date: Fri, 29 Jan 2016 23:22:35 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Wei Huang <wei@redhat.com>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<CAM2+HU4Z39LoKjXqMRDQYbozQAi2-tqdo=d8TLrvVrJ6v6HHyQ@mail.gmail.com>
	<56AB78A6.7070505@redhat.com> <56AB7B48.9020007@linaro.org>
	<56AB7C3A.2080806@redhat.com>
In-Reply-To: <56AB7C3A.2080806@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::234
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"zhaoshenglong@huawei.com" <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-trivial] [PATCH 1/1] arm: virt: change GPIO trigger
	interrupt to pulse
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jan 2016 15:22:19 -0000



On 2016/1/29 22:50, Wei Huang wrote:
>
> On 01/29/2016 08:46 AM, Shannon Zhao wrote:
>> >
>> >
>> >On 2016/1/29 22:35, Wei Huang wrote:
>>> >>
>>> >>
>>> >>On 01/29/2016 04:10 AM, Shannon Zhao wrote:
>>>> >>>Hi，
>>>> >>>
>>>> >>>This makes ACPI work well but makes DT not work. The reason is
>>>> >>>systemd or
>>>> >>>acpid open /dev/input/event0 failed. So the interrupt could be
>>>> >>>injected and
>>>> >>>could see under /proc/interrupts but guest doesn't have any action. I'll
>>>> >>>investigate why it opens failed later.
>>> >>
>>> >>That is interesting. Could you try it with the following? This reverses
>>> >>the order to down-up and worked on ACPI case.
>>> >>
>> >Yeah, that's very weird.
>> >
>>> >>qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0);
>>> >>qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
>>> >>
>> >I'll try this tomorrow. But even if this works, it's still weird.
> To reproduce this case, do the following steps using current upstream
> qemu: create vm => reboot vm (succeed) => reboot or shutdown vm (fail).
> Apparently the last interrupt wasn't received correctly.

Yes, I reproduce this today. Let's clarify current state.
Firstly, for ACPI it should use qemu_irq_pulse since we make the GPIO 
pin edge-triggered. And for DT, it uses gpio-key which is also 
edge-triggered that we could get from output of guest /proc/interrupts.

Secondly, current upstream qemu with your patch makes second reboot 
works when using ACPI. But first shutdown/reboot doesn't works when 
using DT since the systemd or acpid open /dev/input/event0 failed. This 
is what I'm surprised.

Wei, what userspace program your guest uses? systemd or acpid? Could you 
please try to use DT to test your patch? And see if there is a same 
result with me.(I know Redhat kernel uses ACPI by default, so you could 
append acpi=off to switch to DT)

Thanks,
-- 
Shannon


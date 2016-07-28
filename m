Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bSiOP-0007py-Vy
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jul 2016 06:18:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1bSiON-0007mU-QM
	for qemu-trivial@nongnu.org; Thu, 28 Jul 2016 06:18:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1bSiOH-0001zW-TN
	for qemu-trivial@nongnu.org; Thu, 28 Jul 2016 06:18:14 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:33388)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>)
	id 1bSiOH-0001zG-Mx; Thu, 28 Jul 2016 06:18:09 -0400
Received: by mail-wm0-x243.google.com with SMTP id o80so10413110wme.0;
	Thu, 28 Jul 2016 03:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=reply-to:subject:references:to:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=8EgBceuJ5KAN8NUJ+LnVKXFXLZTpEfFEEK8LA6+/2bI=;
	b=IFt7Tze1ExHlAQNzfDFhhWCNtBPRiY+z5jeei667HE77bGjXKZASn6soeHqybVSQae
	4XLemQGQ90oi7RoYbUyEDo/NzpgkCoc/96TjCWsLgzWQAn+r46HIL9sIQ3N3mwlVoT1U
	QpYFAZDoBZLlmGAPzo1X9S904IPK79nIV3kcbT5mfh9iDTj0jsvEaa71vxejg6+uIFwP
	19pkDyXFK0//+jA4YSyX8kciODVT7ZjJJu+g275lfR77Lvq/AbT8MR0MuEac4zlubDhm
	IKMDpomhnEBahvzgceZ0j3SQDyA3nCD+RZ1gmBn8wlBDdSWUQyjUSTks/ikBmyxid/IQ
	hhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:reply-to:subject:references:to:cc:from
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=8EgBceuJ5KAN8NUJ+LnVKXFXLZTpEfFEEK8LA6+/2bI=;
	b=TyHLkPvg0uPxlC0c8VsGL0DjC5wlyEoADFjq3Hmu9cFuCDeFHEkUKMX9FGB8dN6/nJ
	rQ/RGVR/eCwV80EPRYtSJZN830OhyA4QnqF47vDmSQHfaBtpszu37PV9Y3iGDa7/cOaR
	7hJYbbtqhEjSv3RdapbeagHt+u7c9h721d4JxtVBxUaRxoT/lwV6XG+u5kcZZQfIEPt2
	pvfRrDPR9v0mqLARVIE4XWdTUDlwGHJjkdHxlrCKzr/6HWwvJ+DPblFk3EYmbSy7flwh
	q/tlp/+i0X0fTIwsVECnUmSitLVZvKMLVoSXIuNl3DN8NGRX655GxD8aENJPePiqZLOx
	nVcQ==
X-Gm-Message-State: ALyK8tIXhF1BYeM3+FDFrBmVD30YpVnvI5M4AJociAc55VvP4fCidm2nFowkC1HbbJwbtw==
X-Received: by 10.28.61.215 with SMTP id k206mr58994492wma.80.1469701088787;
	Thu, 28 Jul 2016 03:18:08 -0700 (PDT)
Received: from [192.168.1.115] ([46.120.6.143])
	by smtp.googlemail.com with ESMTPSA id
	n2sm10811468wjd.1.2016.07.28.03.18.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jul 2016 03:18:07 -0700 (PDT)
Reply-To: marcel@redhat.com
References: <1463480327-3198-1-git-send-email-weijg.fnst@cn.fujitsu.com>
	<1467257658.2514.14.camel@localhost>
	<1467855432.2119.58.camel@localhost>
	<1468393897.2020.7.camel@localhost>
To: "Wei, Jiangang" <weijg.fnst@cn.fujitsu.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "marcel@redhat.com" <marcel@redhat.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>, "mst@redhat.com" <mst@redhat.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <3d54773c-6567-e801-08d3-5091ce97be0b@gmail.com>
Date: Thu, 28 Jul 2016 13:18:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1468393897.2020.7.camel@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] convert device
 initialization functions
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2016 10:18:16 -0000

On 07/13/2016 10:14 AM, Wei, Jiangang wrote:
> cc qemu-trivial
>
> The following patches had been reviewed one month ago,
> But so far, It haven't been merged.
> May I trouble any maintainer give me some feedback?
>
> hw/pci-bridge: Convert pxb initialization functions to Error
> apb: convert init to realize
>
> Thanks,
> wei
> On Thu, 2016-07-07 at 01:39 +0000, Wei, Jiangang wrote:
>> Ping again ...
>> May I ask for some attention for these two patches？
>>

Hi Wei,

We are very sorry we didn't take your patches yet, we are now in hard freeze,
I am not sure we can have them for 2.7 .

We are going to make sure they get in for 2.8, no further action is requested
from your side.

Thanks,
Marcel

>> Thanks
>> wei
>> On Thu, 2016-06-30 at 03:36 +0000, Wei, Jiangang wrote:
>>> Ping
>>> These two patches seem to be forgotten ...
>>>
>>> On Tue, 2016-05-17 at 18:18 +0800, Wei Jiangang wrote:
>>>> The first had been reviewed.
>>>> The second had been posted last month, but no feedback.
>>>> They're similar, so resend them together.
>>>>
>>>> Wei Jiangang (2):
>>>>   hw/pci-bridge: Convert pxb initialization functions to Error
>>>>   apb: convert init to realize
>>>>
>>>>  hw/pci-bridge/pci_expander_bridge.c | 52 ++++++++++++++++++-------------------
>>>>  hw/pci-host/apb.c                   |  5 ++--
>>>>  2 files changed, 27 insertions(+), 30 deletions(-)
>>>>
>>>
>>>
>>>
>>
>>
>>
>
>
>



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QRYEG-00058A-0c
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2011 19:20:04 -0400
Received: from eggs.gnu.org ([140.186.70.92]:53056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1QRYED-00056l-9Q
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 19:20:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1QRYEA-0001Wd-TC
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 19:20:00 -0400
Received: from mail-yi0-f45.google.com ([209.85.218.45]:51114)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1QRYEA-0001WV-Bw; Tue, 31 May 2011 19:19:58 -0400
Received: by yib19 with SMTP id 19so2389562yib.4
	for <multiple recipients>; Tue, 31 May 2011 16:19:57 -0700 (PDT)
Received: by 10.236.191.200 with SMTP id g48mr7711534yhn.437.1306883997491;
	Tue, 31 May 2011 16:19:57 -0700 (PDT)
Received: from [192.168.0.109] (cpe-70-123-132-139.austin.res.rr.com
	[70.123.132.139])
	by mx.google.com with ESMTPS id k10sm557976yhj.78.2011.05.31.16.19.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 16:19:56 -0700 (PDT)
Message-ID: <4DE5779B.4070304@codemonkey.ws>
Date: Tue, 31 May 2011 18:19:55 -0500
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@web.de>
References: <1306705831-59385-1-git-send-email-andreas.faerber@web.de>	<4DE4F16D.6030009@codemonkey.ws>	<4DE4F5E2.5020906@siemens.com>	<4DE4FAA1.7080109@codemonkey.ws>	<4DE5011C.80000@siemens.com>	<98DD53CD-B6E2-4739-A952-0F21019485A4@suse.de>	<4DE50DC5.2060806@codemonkey.ws>	<35D43777-76C2-415D-83FF-143C4D2EF774@suse.de>	<4DE5462E.80908@codemonkey.ws>
	<DBD1BECA-1726-455B-8A11-E9E8D6C79389@web.de>
	<4DE560F1.70407@web.de>
In-Reply-To: <4DE560F1.70407@web.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.218.45
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Marcelo Tosatti <mtosatti@redhat.com>, Alexander Graf <agraf@suse.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>,
	Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] Use SIGIO with caution
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
X-List-Received-Date: Tue, 31 May 2011 23:20:02 -0000

On 05/31/2011 04:43 PM, Jan Kiszka wrote:
> On 2011-05-31 23:11, Andreas Färber wrote:
>> Am 31.05.2011 um 21:49 schrieb Anthony Liguori:
>>> At one point in time, it was the only way to get a high res clock.
>>> Now, it Just Works provided you don't have an ancient kernel.
>>
>> I'm curious, what's ancient these days? 2.6.29 or more like 2.4.x?
>
> IIRC, highres timers started to work around 2.6.24 on x86. Anyone on
> such an old kernel is likely also not interested in updating QEMU.

Yeah, 2.6.24 is ancient now that we're in the 3.0 world ;-)

Regards,

Anthony Liguori

>
> Jan
>



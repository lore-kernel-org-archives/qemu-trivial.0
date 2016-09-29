Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpWJ6-0006u3-51
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 04:03:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bpWJ3-0006su-TN
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 04:03:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bpWIz-0006cY-OT
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 04:03:01 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:56255)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1bpWIz-0006cK-Ex; Thu, 29 Sep 2016 04:02:57 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue103) with ESMTPSA (Nemesis) id 0Mhf9f-1bd5rS1z9v-00Mtbr;
	Thu, 29 Sep 2016 10:02:53 +0200
To: Thomas Huth <huth@tuxfamily.org>, Greg Ungerer <gerg@uclinux.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <1475021199-28674-1-git-send-email-gerg@uclinux.org>
	<d5a78365-a0a9-d208-442b-32c4f35c5daf@vivier.eu>
	<d1ddd6de-5b17-cad0-f6a1-79ca89896949@tuxfamily.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <93cfc1cc-ca16-ffe8-2192-ee1d4ccf5045@vivier.eu>
Date: Thu, 29 Sep 2016 10:02:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <d1ddd6de-5b17-cad0-f6a1-79ca89896949@tuxfamily.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:jNOE2lEi+8KwyeSA9lLnKmmX/FGRuphmBiZ4PIS+4Y4Gzu7mNpJ
	Bz+aSOxhmHxl8bqN3FULKsdUr73sXMqIzS21++qXuij74IsXJqiHPt9XSu2qH+0SpIgKy0p
	Q4fZr9plfhX7OyNtVQtAnxVqaMkbM/9aNjwP8KHblnqcB7sIiJLFNtIBqyZbAFof0geTkTx
	YHQ3JjHy+2b9vJwAaJpcQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:EsPmKDfJoEY=:53711emEDonAgXYRxEaG83
	aqjjv7yTdsb1Gp4SM1+lvmlndkVqyab30MBmLDt+hxSD8YZ5tC+GdgryuyZ8jKeIW0SWGzh2f
	jurQT0c/XBpljUGNN33f/NJzEFstKG3Cq2nnnWoZD6iZUK1qQNHlveZnHmDfijpAQ182bSkjZ
	XLiPFnCnZfWIhnlqnRLwfkiYUI4LNK+fMKHbYzWngUZXmjbtmVjdM+qAzf2sUeNR/cpihbEFk
	Gdp3QjZ4oD08MRyk54g+mcxG8vbf8viVhTeY7mq5+LVVWCrvNV6OmHEpH5/VL9KAauKmV/XHQ
	mCsI/2fitRAjqGW1PVfN2N+XJ5VUCNBcAZNioN4XuH1+UX9wubHMSKYGrmfl9mS8JQLSAyRID
	3dPR+1lygbE65Xg18g4DeuNRNT/+tmHmn6uVbArR0DH8rb3vr6Saids1TSryevQGYegzy8uIn
	SASpNdv4owgkyBSXo9Uk5IiijdpJopCog30EH/IQivoyVc38u0vqMYT0XxsD/zQfCBoBRsvn6
	yPZO9+pRNet3hqAxGR8F+yhA76K09VK22coPylGAs5Rc+OTl/YgdcFp7Hs2fjz1NUhhPywjqy
	kZFYemiUjkVsmqyV2nCrhAq0GM87sJmRBEi+3PmxdmpIgkDyVEU5xFrQGBvoDHm4W6ep/WHpI
	57sZqO0HvWo5n9UZvM32Inw90qf4aIQW8MHC1HNPAjF3/m+HEib+CvqQCLgGdz9tKbDM6ikFr
	t0y5jdC1+aefmEZz
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCHv2] m68k: change default
 system clock for m5208evb
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
X-List-Received-Date: Thu, 29 Sep 2016 08:03:03 -0000



Le 29/09/2016 à 09:56, Thomas Huth a écrit :
> On 29.09.2016 09:50, Laurent Vivier wrote:
>>
>>
>> Le 28/09/2016 à 02:06, Greg Ungerer a écrit :
>>> The shipping default setting for the Freescale M5208EVB board is to run
>>> the CPU at 166.67MHz. The current qemu emulation code for this board is
>>> defaulting to 66MHz. This results in time appearing to run way to slowly.
>>> So a "sleep 5" in a standard ColdFire Linux build takes almost 15
>>> seconds in real time to actually complete.
>>>
>>> Change the hard coded default to match the default hardware setting.
>>>
>>> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
>>
>> This solution is as good as another, so:
>>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> 
> Fine for me, too, so:
> 
> Reviewed-by: Thomas Huth <huth@tuxfamily.org>
> 
> By the way, we still do not have a m68k maintainer yet ... Laurent,
> maybe you could finally send a pull request for that patch here:
> https://lists.gnu.org/archive/html/qemu-devel/2016-05/msg00805.html ?

Well, this patch was waiting I resend my 680x0 support series, and I
didn't have the time to rework it until now... but if you want to merge
it as is, don't hesitate.

Thanks,
Laurent


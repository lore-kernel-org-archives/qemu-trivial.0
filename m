Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROUge-0003Yu-UQ
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2011 08:29:00 -0500
Received: from eggs.gnu.org ([140.186.70.92]:58492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <donald.open@gmail.com>) id 1ROUgY-0003Jj-BR
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 08:28:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <donald.open@gmail.com>) id 1ROUgX-0008Ci-9J
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 08:28:54 -0500
Received: from mail-wy0-f173.google.com ([74.125.82.173]:35053)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <donald.open@gmail.com>)
	id 1ROUgV-0008C0-41; Thu, 10 Nov 2011 08:28:51 -0500
Received: by wyh22 with SMTP id 22so2964981wyh.4
	for <multiple recipients>; Thu, 10 Nov 2011 05:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=wGFVbvDSApF6Kz+XXciGAPkvJ37YDXUmgh8l8LLylow=;
	b=JMf6NenTUpz+VUVagVbmd5dx7HmHZzXAQ5eoYta5qPKiKdwe9OYGFHNuvpGoo338J0
	SWP5lGy7X2fj6cmDhJhx2lMbHtXgzt/NN+sckaHATspZ2cgk8KOgvcnXdiOUcMnN1csP
	uei8Y+sGD8npbHK0M3NvOkoDmu81vtht2+Aj8=
Received: by 10.216.229.32 with SMTP id g32mr1076381weq.84.1320931730138; Thu,
	10 Nov 2011 05:28:50 -0800 (PST)
MIME-Version: 1.0
Sender: donald.open@gmail.com
Received: by 10.216.86.130 with HTTP; Thu, 10 Nov 2011 05:28:09 -0800 (PST)
In-Reply-To: <20111110113228.GA12527@stefanha-thinkpad.localdomain>
References: <1320913402-8762-1-git-send-email-wdongxu@linux.vnet.ibm.com>
	<20111110113228.GA12527@stefanha-thinkpad.localdomain>
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
Date: Thu, 10 Nov 2011 21:28:09 +0800
X-Google-Sender-Auth: Onj_g4HMD8bQ-yRTWB3BGonNwFE
Message-ID: <CAGrFBsir-S==67-5Kvfvyy33XEYEXw-KGD+iOeRyfinvv-P_ZQ@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block:add coroutine_fn
 marker to coroutine functions
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
X-List-Received-Date: Thu, 10 Nov 2011 13:28:59 -0000

2011/11/10 Stefan Hajnoczi <stefanha@gmail.com>:
> On Thu, Nov 10, 2011 at 04:23:22PM +0800, Dong Xu Wang wrote:
>> From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
>>
>> Looks better when reviewing these source files.
>>
>> Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
>> ---
>> =A0block/qcow.c =A0 =A0 | =A0 =A04 ++--
>> =A0block/qcow2.c =A0 =A0| =A0 =A06 +++---
>> =A0block/sheepdog.c | =A0 =A04 ++--
>> =A03 files changed, 7 insertions(+), 7 deletions(-)
>
> Reviewed-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
>
> Looks fine but please send all block patches through Kevin, who actively
> maintains the block layer.
>
> Stefan
>
>
Okay. I will next time. :)


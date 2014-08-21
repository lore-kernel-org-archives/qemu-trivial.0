Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XKP96-0002gE-PA
	for mharc-qemu-trivial@gnu.org; Thu, 21 Aug 2014 05:59:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XKP90-0002WI-Dl
	for qemu-trivial@nongnu.org; Thu, 21 Aug 2014 05:59:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XKP8v-0004QC-08
	for qemu-trivial@nongnu.org; Thu, 21 Aug 2014 05:58:58 -0400
Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232]:41415)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1XKP8u-0004Q8-PW; Thu, 21 Aug 2014 05:58:52 -0400
Received: by mail-wg0-f50.google.com with SMTP id n12so9072979wgh.9
	for <multiple recipients>; Thu, 21 Aug 2014 02:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=k2JF6lymA/Fsj40gt1iPsfXYhO4Dc3patsQ5y+JT9NU=;
	b=Q6VqMrTqUd7nWiAdhY+86KSWkdeM4L7JWnC1i3WxmKYfx0VOCo59nrJ9RmzKuvFky8
	eN/Q6jp2yDzPXZchwo5Ni1JJKsxnf6P2ZN6L9EaMccVTqFR7Rv8dYTL1nX1/Lhh7sPIT
	iEA7B+Z8iLdN464L+yMq3QHtdAB42Lu6aziif9DSW3RaHKIegpoHSnvFivnwqlw+XYjM
	ysVhjtZT2VvGbIPQF6TJNXb0zs3tLdk5Ii/XXgRSdt9ynnJSuKuwV0qvoFfsiRAdenZh
	MnXoW3w55VGO2PLbqmhdtDiyXSb3+/Y5YHSAblxKQfpU+F1M7M5CKBwcvqiM5atYBs87
	4qRQ==
X-Received: by 10.194.184.101 with SMTP id et5mr22477762wjc.14.1408615131831; 
	Thu, 21 Aug 2014 02:58:51 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-135-145.cust.vodafonedsl.it. [37.117.135.145])
	by mx.google.com with ESMTPSA id
	ez1sm18386577wib.15.2014.08.21.02.58.49 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 21 Aug 2014 02:58:50 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <53F5C2D8.8050106@redhat.com>
Date: Thu, 21 Aug 2014 11:58:48 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	Johny Mattsson <jmattsson@dius.com.au>
References: <CACTyEaOFhLnoA5TDHGkDpxpP+TxVKyuTT9AL+q8Y1kaa+wxE5A@mail.gmail.com>
	<CAFEAcA_bCOTLT1jvvJp+Wtaah43qb-UQgzxRuZc3WcyzNPrjSw@mail.gmail.com>
In-Reply-To: <CAFEAcA_bCOTLT1jvvJp+Wtaah43qb-UQgzxRuZc3WcyzNPrjSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::232
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] Fix pflash_cfi01 to restore flash
 command/array state after migration
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
X-List-Received-Date: Thu, 21 Aug 2014 09:59:04 -0000

Il 21/08/2014 11:22, Peter Maydell ha scritto:
> On 21 August 2014 08:35, Johny Mattsson <jmattsson@dius.com.au> wrote:
>> > When using snapshots on e.g. the VersatilePB board, the pflash driver
>> > would report an error and get reset at times after resuming the snapshot.
>> > This was traced down to the 'romd' flag in the pflash emulation which was
>> > not being persisted in the snapshot.
>> >
>> > Author: Bernd Meyer <bmeyer@dius.com.au>
>> > Signed-off-by: Johny Mattsson <jmattsson@dius.com.au>
> Paolo -- remind me, is it the device model's job to keep track of
> what its memory regions are doing, rather than the memory region's
> job to make sure it's migrated? I definitely remember having this
> argument with Avi before but I can't remember the outcome...
> 

It's the device model's job.  I agree with your review, and I think
romd=1 is the right default value if the subsection is not present.

Paolo


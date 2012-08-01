Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwX1J-0002sz-6t
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 07:23:17 -0400
Received: from eggs.gnu.org ([208.118.235.92]:32920)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwX1E-0002if-AP
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 07:23:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwX15-0004Dj-KK
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 07:23:12 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:48292)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwX15-0004DX-Fs
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 07:23:03 -0400
Received: by yhpp34 with SMTP id p34so6908727yhp.4
	for <qemu-trivial@nongnu.org>; Wed, 01 Aug 2012 04:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=rQit2vCqauiGtBY1LSIHkZp1mPyhVTP3XART6CogiRk=;
	b=G8Jt4fu3HYI/nd1DtwZUSFY+E1WrKOMP25EsK2Hnxs3MMR180kTqWE2suf+L/w3KNd
	4dNTZyz3EmbxLcKHKYKWav1Ibdpif/2N9BbDTG/BjWCczymDs/KGV/diU6U9b5bnVFNR
	8bfFaU3jehSatSHTFVDw6V0q2Z9oj7uF69vHlBdksUKyf7zW9oJG3n6aPmvbKASvcCWy
	/6J3iKp/PfzgHTLbFHm7SP64jeipDcWU6r7ckriqMLFYhKDfwyX+nKP1x9Bll7Ue+tcJ
	QSjbplT/xXoHWjRDSyABleALn0GSH5eOSlon/V30FF9P70eJPiCqId9KoPaJYoxI9Lry
	ItMw==
MIME-Version: 1.0
Received: by 10.50.237.73 with SMTP id va9mr4916633igc.3.1343820182562; Wed,
	01 Aug 2012 04:23:02 -0700 (PDT)
Received: by 10.50.237.41 with HTTP; Wed, 1 Aug 2012 04:23:02 -0700 (PDT)
In-Reply-To: <20120801105011.GC17816@stefanha-thinkpad.localdomain>
References: <1342539951-30915-1-git-send-email-akong@redhat.com>
	<1343811543-12137-2-git-send-email-akong@redhat.com>
	<20120801105011.GC17816@stefanha-thinkpad.localdomain>
Date: Wed, 1 Aug 2012 12:23:02 +0100
Message-ID: <CAFEAcA9_ATmjm95ottBKtpbaB5uEzOS2KNk19v6_vyngR8ZUKA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkRUutXI13lOaHPqSi7P1DN6vECvkXJB+/CnZU4Z2YTsZ/yYPkK9aoyTaYPU2NH1XjiIygK
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org,
	quintela@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [RESEND PATCH 1/3] socket: remove
 redundant check
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
X-List-Received-Date: Wed, 01 Aug 2012 11:23:16 -0000

On 1 August 2012 11:50, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> This isn't obvious.  It looks like the intent of the if (!e->ai_next) is
> to suppress the error so that the next iteration of the *outer* loop can
> succeed.

Yeah, we only call it an error on the last time round. This
loop is a bit confusingly structured, since we're effectively
handling the failure in several places at once: we always
fprintf() something, then we set the error on the last time
round the loop, then at the end of the loop we fprintf again.
We also duplicate the loop termination condition.

It might be better to have an Error *local_err in this function.
Then we could unconditionally call error_set() for any failures,
passing &local_err. Then at the end of the loop we can call
error_propagate(errp, local_err) to pass an error up if we
didn't succeed at all. Unfortunately you'd have to do
    if (error_is_set(&local_err)) {
        error_free(&local_err);
    }
    error_set(&local_err, QERR_whatever);
for the error setting, since error_set() will assert if you try
to set an error twice.

[Another demonstration of the fprintf errors being much more
useful than the error_set mechanisms at the moment, incidentally.
We can get away with the fprintfs because the only caller of this
function which passes in a non-NULL errp is the migration code
called from vl.c, which is just going to fprintf and exit on
error anyway.]

-- PMM


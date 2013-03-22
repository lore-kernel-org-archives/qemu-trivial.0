Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UJ1QU-0002Fx-F0
	for mharc-qemu-trivial@gnu.org; Fri, 22 Mar 2013 08:50:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UJ1QR-0002Cc-H0
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 08:50:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UJ1QL-0006fp-Us
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 08:50:27 -0400
Received: from mail-la0-x232.google.com ([2a00:1450:4010:c03::232]:51618)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UJ1QL-0006fQ-N6
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 08:50:21 -0400
Received: by mail-la0-f50.google.com with SMTP id ec20so7049043lab.23
	for <qemu-trivial@nongnu.org>; Fri, 22 Mar 2013 05:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=QLf99TR25AUkKnpo8mVVJfssXniaBAis9Q6GNqdPWXw=;
	b=GbHCDJWDRQTRNVYWf00por2Y+ZWBFcGzE1NEBeYODgvzTvXqNdZskTnuYy3UltBUZj
	zDcYvWrN3DytraJ8glNWFIHzWzxnWgS6Kr4RHBxFeBH/zkMhN24KggM7QJ084BiSo/6y
	fX5NTq13JX4uvWsMKUh2cPcXdsTpO3SqbDwPLTnDoP9L/lZqIGGc25ZpwTwXl+mntsgn
	oZjTKJM5lDOpNTYT/ugppIOLp3MFJWYgXYL5VhmHVhuznIWy1TO4lOZrHdWK1ate5tpB
	AQrIRaQNKTt/ti5MZne1JTxFEFgN4MwsEX6o9JpnSCrhVgBnIVzRwFXHG9Mb9z+MVSjs
	HDYQ==
X-Received: by 10.112.10.102 with SMTP id h6mr1016144lbb.75.1363956620521;
	Fri, 22 Mar 2013 05:50:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.2.202 with HTTP; Fri, 22 Mar 2013 05:50:00 -0700 (PDT)
In-Reply-To: <20130322122227.GB30604@stefanha-thinkpad.redhat.com>
References: <1363329121-20625-1-git-send-email-hutao@cn.fujitsu.com>
	<20130322122227.GB30604@stefanha-thinkpad.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Mar 2013 12:50:00 +0000
Message-ID: <CAFEAcA-jDhXjRs8FhMc8vmUouGPQwWptNw97HSQG3Lo_bHhsVw@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQn+gHsAeAzVrW3APS6RG/y/cid4mhLDWhvUU16LokrESsaMYp8J8B1OrmK0xjtw3sRO5M76
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::232
Cc: qemu-trivial@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] memory: fix a bug of
 detection of memory region collision
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
X-List-Received-Date: Fri, 22 Mar 2013 12:50:29 -0000

On 22 March 2013 12:22, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> The int128_le() comparison below suggests that int128_gt() really should
> be int128_ge().

Agreed. It might be clearer to rephrase as:

 AddrRange thisrange = addrrange_make(int128_make64(offset),
                                      int128_make64(subregion->size));

 QTAILQ_FOREACH(....) {
     [...]
     AddrRange otherrange = addrrange_make(int128_make64(other->addr),
                                           int128_make64(other->size));
     if (!addrrange_intersects(thisrange, otherrange)) {
         continue;
     }
     [...]
 }

(maybe with a new utility addrrange_make_64() that takes uint64_ts;
there are a few other places in memory.c that could use it.)

-- PMM


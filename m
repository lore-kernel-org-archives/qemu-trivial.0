Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b2HY2-0008Ho-59
	for mharc-qemu-trivial@gnu.org; Mon, 16 May 2016 08:22:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1b2HXr-0007w2-B5
	for qemu-trivial@nongnu.org; Mon, 16 May 2016 08:22:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1b2HXp-0008WS-BV
	for qemu-trivial@nongnu.org; Mon, 16 May 2016 08:22:46 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:33046)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1b2HXh-0008VK-3d; Mon, 16 May 2016 08:22:37 -0400
Received: by mail-wm0-x241.google.com with SMTP id r12so17662515wme.0;
	Mon, 16 May 2016 05:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=QgcGh5y6uUMmzHas3tSNtJqiaqGYiwaGlcqOZ+GeqNQ=;
	b=qjgp2yYjp3DHKFAi7pQ8BkDh6h9/w/pB999YdUlCOxBiS6V95Flp6chwAX9+tAIGfM
	2kZOspaqq/ldycDHHPve11qqJIokqcEGHFk763Sc1fGjh0Y1UXbh+ffbiTEnuKWjjrOw
	X9GgzDr89sGlzeGJ9luGQoJFLakcP0tbGKgcbwCtR0rRg/6MkEHphCb/Eky0l/VULRpQ
	Bz4dWlftD5qtBFehTr2Qe249s/dmG2rLikUNqkHCGyheh768WRlOz3H9LqKvkHMXwS+h
	fVl4szhXOZBt/LjdAPZB9ePA+9ThSgZQ4Am6tgcoc13K90Tcj74vaJyFKwLKvxzT4ShC
	FuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=QgcGh5y6uUMmzHas3tSNtJqiaqGYiwaGlcqOZ+GeqNQ=;
	b=h2o1vXIYM6D1BVFnDTCxtD8hR4fmmFXzkwugr6ZqOl4h+17+ehXK+pOIgVmEyxlxzF
	s2kdTS3S8cA0fU+IyLGWKkWsL3eSOjCbcJ50y0LawrBrG+MWCxAS52mZEgM6h4YDsb97
	6nbTwgg8gKYG7PAwOlVMADHwI+hN4Fc3jGSsl2Hu5p4uvgPA1ktzLZqnUfTWZ/3cQumi
	5LesMJRW5zmrhP6eecguQIk8fbGRKxEB2V+uHARmzkwg5zV//MaBjRozaRkYIeFmhVKX
	I8SM8x5TVSv9jWVQ2uM/5PAtYUaGfP+55kSRAnT0odLDSIDa7eWhQeRgvXXBDXlwtPxk
	jOVg==
X-Gm-Message-State: AOPr4FWtnypgaHqvZI4ZhsHjAoG8wy//OKTBT3yXLkvv/teAdbt6H/iN1nJXFh4QRQd/4A==
X-Received: by 10.28.169.69 with SMTP id s66mr17175430wme.83.1463401356414;
	Mon, 16 May 2016 05:22:36 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-78-12-252-58.clienti.tiscali.it.
	[78.12.252.58]) by smtp.googlemail.com with ESMTPSA id
	lm1sm33460848wjc.25.2016.05.16.05.22.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2016 05:22:34 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>
References: <1461879221-13338-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA_AGhFyNdXZkMzs2P4XzgEgPGyHhjr+vp78DBD3NnJaZA@mail.gmail.com>
	<5739AE8A.9080604@weilnetz.de>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>, qemu-stable@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5739BB81.8080307@redhat.com>
Date: Mon, 16 May 2016 14:22:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <5739AE8A.9080604@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [PATCH for 2.6] configure: Allow builds
 -Weverything
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
X-List-Received-Date: Mon, 16 May 2016 12:22:57 -0000



On 16/05/2016 13:27, Stefan Weil wrote:
> I think this patch which was too late for 2.6.0 is a candidate for
> qemu-trivial, maybe also for qemu-stable. CC both mailing lists.

Yes, it is confusing to have --disable-werror compilations break because
of warnings becoming errors.  However, the subject is imprecise, what about:

----
configure: Allow builds with extra warnings

The clang compiler supports a useful compiler option -Weverything,
and GCC also has other warnings not enabled by -Wall.

If glib header files trigger a warning, however, testing glib with
-Werror will always fail. A size mismatch is also detected without
-Werror, so simply remove it.
----

Thanks,

Paolo


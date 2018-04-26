Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fBfly-0005uQ-4L
	for mharc-qemu-trivial@gnu.org; Thu, 26 Apr 2018 08:13:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fBflw-0005si-D8
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 08:13:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fBflv-0001CJ-ED
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 08:13:12 -0400
Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236]:46475)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fBflv-0001C7-9B
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 08:13:11 -0400
Received: by mail-oi0-x236.google.com with SMTP id y15-v6so15909351oia.13
	for <qemu-trivial@nongnu.org>; Thu, 26 Apr 2018 05:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=296uD0TKRVg8DhHVlnlRYbNAXiznt2lxOZVn3pldObE=;
	b=GXR12q6+t3kQtqvWgQ7gG+z2Pu7CzhlftjIwOtzMeSejRSa6UnbpyM3BmLObl38OAd
	YejwpFY3ea4Z7/fz1jMywD9CaOiBeNU9zcUmxAV/ISvvuBO1yi92HG+z5LZAsLPQDPE3
	xFRFmrKwyX/sxPgyUL7jsRGEvtmXeLcdv8+GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=296uD0TKRVg8DhHVlnlRYbNAXiznt2lxOZVn3pldObE=;
	b=FaMsaJmP4b7cG1uSR6iMgxem9EFW9ZCneNzqP/QRO/iuwJKXy982/xx5ES3ZCkJpLN
	pawULe3VAQQWGOzuHUVJOE1H0Qd7aoR9mc2Y/3aSDcth2IeR6FuIrIrDDiDAQCTd2zOz
	q/C16TrusAOXknZTfy+SfbKT+BluBwQJwzOSEc+nZrKKs16RluJXfHWfb8k/E7wLWEH4
	DBxypkpiEOjvjYle1h6ZIQjUQuTkuLJLmv6U1ClvCDlOq9PdOk+ZtNHcaHw+5lyxIc1G
	qvyR95Ht1hFWHFcylJAcpZULFxhO9yfH5rI5jhYJ9BVbrbYeIrslSboYd7GKCbrhkFMV
	lUUA==
X-Gm-Message-State: ALQs6tDL1U6+meihx1hKiiRz/1iKnFwRSVzr9dBOVVfsFBbnewuqApTU
	bkkBSK+TfqHajt919Uya2CGa/869GYa5J0QL8UcRuw==
X-Google-Smtp-Source: AIpwx49Vtp2g4RXTX0so83i0gQHW0pKdZ6BSDrrPKDQA7K0KvjAiyjX+gxEd6JyNLgRnSbNoFwmLnXN9Xpq8n2fFE/M=
X-Received: by 2002:aca:43d5:: with SMTP id
	q204-v6mr21263066oia.80.1524744789394; 
	Thu, 26 Apr 2018 05:13:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 26 Apr 2018 05:12:49
	-0700 (PDT)
In-Reply-To: <20180426140807.4a4a577b.olaf@aepfle.de>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418124753.GM27579@redhat.com>
	<CAFEAcA_TtC-p4JJFRPaBFwim1a8J9G+z79KAK8vqrTx7ZKjOKg@mail.gmail.com>
	<20180418144433.GV27579@redhat.com>
	<CAFEAcA8jXwo35B7KVdVZEiqZTtMRvVXCP87iHKECjWPkHiTJ_A@mail.gmail.com>
	<c9b7c417-e714-658b-20da-7150c9ec8ab9@redhat.com>
	<20180426140807.4a4a577b.olaf@aepfle.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Apr 2018 13:12:49 +0100
Message-ID: <CAFEAcA_LnnBXf9f8UZ=6upipb2QN5GQd6XTwxHbp+yCmpPGnOg@mail.gmail.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Fam Zheng <famz@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::236
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] configure: require
 glib-2.24
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
X-List-Received-Date: Thu, 26 Apr 2018 12:13:13 -0000

On 26 April 2018 at 13:08, Olaf Hering <olaf@aepfle.de> wrote:
> Am Thu, 26 Apr 2018 13:52:04 +0200
> schrieb Paolo Bonzini <pbonzini@redhat.com>:
>
>> min-glib Dockerfile is using glib 2.22
>
> Why did it not prevent the bad commit from entering 2.12?

Most immediately, because I don't use that as part of
my per-merge testing.

thanks
-- PMM


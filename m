Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQbXf-00069x-Is
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 12:44:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1fQbXd-000693-Bv
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 12:44:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1fQbXc-0003fK-LZ
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 12:44:09 -0400
Received: from mail-yb0-x241.google.com ([2607:f8b0:4002:c09::241]:38152)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1fQbXa-0003dY-KI; Wed, 06 Jun 2018 12:44:06 -0400
Received: by mail-yb0-x241.google.com with SMTP id q62-v6so2204762ybg.5;
	Wed, 06 Jun 2018 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=djpZuru4l86t4wtG4q/q1X1epTQGTMsjfZSF09x5guk=;
	b=krEbHi2NZfm/fhWl0pX/+jpv7kMstdhEz4S4tufti1pPsN8WVJCOkOZI97byrr7oPk
	lcF5++Z/AHQ0CEqnESvCHuqpKpO8bKXYAOfsa0iGNt7X1YBAYchueVeuU93cZ6As8lLt
	x5KV6EfeNZTX58B+n4CJDK5D/+O+sXU7DQq1NXYCt64h/5UkyudAxWSeOr3i1JCBQlBY
	2ZIGQWZlFgKqlMfUmqXEjwXwyitG1dBIaRX5+eS82qMVEWQYUNmdEOFaJJsPoV9WxXP6
	BDxCUc4WdAMwnrAEDYac1gfieMkJiMdrPDpHjsTlq45kvR7Vl2z4VsXbxWVF8EB8uPq7
	IPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=djpZuru4l86t4wtG4q/q1X1epTQGTMsjfZSF09x5guk=;
	b=Vj8N8nQ2mzURqKmHhBZ1KLMhT5qPHZbRg2EmI3f+sgP5tKhmT1knIKOdFpzfW7yjRS
	CHTkymYEw4dPemPBO31Q1Bf1CmMozu2RnWLXjwhZPSjkNdrwAKnfqH5haUCAvyFn1y0f
	IETu1nbV9tJAZZwU4rUqzHn4LxcOET+Us8stgLqxP4y3cGZDfsS2WCH49jdpCCbUKShG
	GK9uPahL1xsYPFzrZHyAOr+OLPpqdadJM3afubpRLYgRLAQA7o8SjYrvxF+DrcA8UG6q
	U/uX/xRfcKjK21Iv8F+KgdmlWFikFkWGY9nGZHqsHavtL31IUGTBXeC3mvpnfPZOFM7C
	9eYg==
X-Gm-Message-State: APt69E16RZ3AiQZv2N/19vGS3h0xfGYz44xRuPIWV2rEV/lDwluQ0eRH
	H1CoZ8VMRDiuw5LtasBZbL8JbJj83pZu/W4ixeE=
X-Google-Smtp-Source: ADUXVKJr1R/C8JYscl3YMGIXae7Bi5ZXbQX1CUTixFhRb6mrx+2kuf2Iw6rYeeP4bw6sbhHGk3tCclKv+QqukBd1Frw=
X-Received: by 2002:a25:ac06:: with SMTP id
	w6-v6mr1775080ybi.153.1528303445682; 
	Wed, 06 Jun 2018 09:44:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:28d:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 09:44:05 -0700 (PDT)
In-Reply-To: <20180606152128.449-12-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
	<20180606152128.449-12-f4bug@amsat.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 6 Jun 2018 09:44:05 -0700
Message-ID: <CAMo8BfK-86N1__q5A4RBAOz3g3JZ_6ibcp8SZCPmk3vJakWQ-A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::241
Subject: Re: [Qemu-trivial] [RFC PATCH 11/11] target/xtensa: Add trailing
 '\n' to qemu_log() calls
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
X-List-Received-Date: Wed, 06 Jun 2018 16:44:10 -0000

On Wed, Jun 6, 2018 at 8:21 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> RFC because I think the qemu_log_mask() was previously intended to concat=
enate
> output to stderr... (multiple registers described on a single line).

No, there were no such intent.

>  target/xtensa/translate.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max


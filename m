Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1csrTO-0001GV-Ou
	for mharc-qemu-trivial@gnu.org; Tue, 28 Mar 2017 09:47:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1csrTM-0001Eo-QD
	for qemu-trivial@nongnu.org; Tue, 28 Mar 2017 09:47:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1csrTL-000169-Sr
	for qemu-trivial@nongnu.org; Tue, 28 Mar 2017 09:47:44 -0400
Received: from mail-lf0-x229.google.com ([2a00:1450:4010:c07::229]:33558)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1csrTL-00014u-Ld
	for qemu-trivial@nongnu.org; Tue, 28 Mar 2017 09:47:43 -0400
Received: by mail-lf0-x229.google.com with SMTP id h125so38508075lfe.0
	for <qemu-trivial@nongnu.org>; Tue, 28 Mar 2017 06:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8mMclR61sWxLnP9yCbLZ+yDrq8EFgSLOhq0VnYuv4X0=;
	b=JqLNn5LjqVcfkUSFZkYaxplUbqXFEvaa4jhLq0L69nN9/6FkU4iJk3i893OFxQlCST
	92ztg+nNmJiz0Di8JgiE5fVDR0WxdqHGRnqzTIq/EDkyedilcuD+ihR1j1zEfK0wZMHu
	N3hTHJqNShBO+/xbw+3e9cRdpiR5BYTsJd5/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8mMclR61sWxLnP9yCbLZ+yDrq8EFgSLOhq0VnYuv4X0=;
	b=aKzFLPOlYxscvvWv3+VydLimvNsu5Q0bufX0tVwefZ4p66kj8uyDGouaT6KEyhDX/K
	KqYwnV9O2Qcvz8CWwFskNwvT27ijV8cg3+h7K2LxVL/aGRoHm+ZydeTnaq+LQWDi8u+/
	W9nW3svDlU1q6VUg3Vv5gY+261sWk+GiVqL6UCeEErQRxZYaxyBTSACLTy7AJ0pLyee6
	9qjaUT4da+IqKyLAdH8A6QFzc/I6RD5c/uxEa4FtAMl4mviO4eG6kfx3oivbU7LBmpTj
	IU0E4ckgLU32ZedpeyKyzRFqPoOVJ6o4z/CdTJrRcHgUfNqjTYoxuBkgjnjdUPSqeAkM
	I2Wg==
X-Gm-Message-State: AFeK/H320xbCk+RkzYhB2wV9CxWVSvOPtSVd6nhQrORv+6bQxe3GhVAxj/H5m6uglnM9TkYdaFQIwOuWGZMiPVtX
X-Received: by 10.28.167.203 with SMTP id q194mr14745533wme.111.1490708862309; 
	Tue, 28 Mar 2017 06:47:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Tue, 28 Mar 2017 06:47:21 -0700 (PDT)
In-Reply-To: <076d02e7-643c-5d8b-fcef-8660e1269a05@amsat.org>
References: <20170320173828.3874-1-sauravsachidanand@gmail.com>
	<076d02e7-643c-5d8b-fcef-8660e1269a05@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Mar 2017 14:47:21 +0100
Message-ID: <CAFEAcA9__yPLkfyjqp62F7T0gYMFdKoNZH=hJN9RN9x6+guRDA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Saurav Sachidanand <sauravsachidanand@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Stefan Hajnoczi <stefanha@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::229
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5] util: Use
 g_malloc/g_free in envlist.c
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
X-List-Received-Date: Tue, 28 Mar 2017 13:47:45 -0000

On 28 March 2017 at 14:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wr=
ote:
> Hi Saurav,
>
> you should read the QEMU Coding Style and replace your tabs by 4 spaces.

Er, in review comments on v3 we said not to do that...

thanks
-- PMM


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnKAI-0007so-Gf
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2017 03:45:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1dnKAG-0007rW-Nv
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 03:45:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1dnKAF-00063v-RY
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 03:45:24 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:55907)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1dnKAA-000606-HQ; Thu, 31 Aug 2017 03:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
	bh=L2zRsj3McLJGch+X0YsOYedX3y7AGsCbFfj9VzSdRVA=; 
	b=olBel36VJtANsIqD1W8NMFPaYWVZQXMJa1hvl1/id6ZMbe4vnryoPkOnLiGz1K3zC3PaesjgKTE6n5gfzfulEz0adkDISjFDNozRgr4Nsh1bmy7/Jh/a/+h8ZMpsB7ofIuTzOPS/uKCicpYzQ3S0naVC0XqaiY3fvKCzLiN/TXXFUKVx3/9e142z2+N+IuyHe7l84lG4puHL/e9/XhIRA9n7TYUbyCaqN7r3ab+AEX1XGDA6ABbQPuNveu7ShnsMoTGEUvu3Dyuz+JaxtVrw6KXmsDQabdvXHR7P5ZyGZiPrQ1/9nseGHW0mk4xihfzzmK0voj1KD+ieBGWQ2I1eiw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1dnKA5-0004Wz-3W; Thu, 31 Aug 2017 09:45:13 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1dnKA5-0003yo-0u; Thu, 31 Aug 2017 09:45:13 +0200
From: Alberto Garcia <berto@igalia.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Stefan
	Hajnoczi <stefanha@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
In-Reply-To: <20170830215523.25278-12-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
	<20170830215523.25278-12-f4bug@amsat.org>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Thu, 31 Aug 2017 09:45:12 +0200
Message-ID: <w51val441vb.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-trivial] [PATCH v2 11/17] MAINTAINERS: add missing
 entries for throttling infra
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
X-List-Received-Date: Thu, 31 Aug 2017 07:45:25 -0000

On Wed 30 Aug 2017 11:55:17 PM CEST, Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto


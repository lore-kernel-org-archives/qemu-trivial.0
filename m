Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rzooy-0000r4-Oc
	for mharc-qemu-trivial@gnu.org; Tue, 21 Feb 2012 07:27:52 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rzooq-0000QS-Ts
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2012 07:27:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rzool-0002VV-1Y
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2012 07:27:44 -0500
Received: from mail-lpp01m010-f45.google.com ([209.85.215.45]:42318)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RzooZ-0002UM-FS; Tue, 21 Feb 2012 07:27:27 -0500
Received: by lahi5 with SMTP id i5so8199826lah.4
	for <multiple recipients>; Tue, 21 Feb 2012 04:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=MkivH5C5mZtrWlwxBb3Q9GQ+aPbAPunsKbLLIzTs1jc=;
	b=Ri/61Hgn0EQXfiCK3dQShav9bz64fdZMb+L5uXo1bNwRRKs3cTb6y/m26OucGK4yyP
	uLQI4T/p7GBNQb98tbcXhM6VGF1kdhYXeKjoSWdkL3HKRcfkzDL7vqHuPMh6Tn2mZe9n
	ZRpmfFpx3roHoroZexwZhwq+J3kC08DZcfqdA=
MIME-Version: 1.0
Received: by 10.152.144.39 with SMTP id sj7mr6525649lab.29.1329827246402; Tue,
	21 Feb 2012 04:27:26 -0800 (PST)
Received: by 10.112.66.45 with HTTP; Tue, 21 Feb 2012 04:27:26 -0800 (PST)
In-Reply-To: <20120221101239.GA95445@cs.nctu.edu.tw>
References: <20120221101239.GA95445@cs.nctu.edu.tw>
Date: Tue, 21 Feb 2012 12:27:26 +0000
Message-ID: <CAJSP0QXhexX4wZUMjGb3mS6u7Rvfi4-ePmQeg=9g0-ZgTSmPsA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?UTF-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix dependency issue introduced by
	commit 7b93fadf3a38d1ed65ea5536a52efc2772c6e3b8
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
X-List-Received-Date: Tue, 21 Feb 2012 12:27:50 -0000

On Tue, Feb 21, 2012 at 10:12 AM, =E9=99=B3=E9=9F=8B=E4=BB=BB <chenwj@iis.s=
inica.edu.tw> wrote:
> =C2=A0Commit 7b93fadf3a38d1ed65ea5536a52efc2772c6e3b8 adds basic version =
of bridge
> helper, but introduces dependency issue at the same time. While building =
target
> xxx-linux-user, qemu-bridge-helper.c needs config-host.h which is not gen=
erated
> at the moment. Building recurse-all target first fixes the problem.

The build system should not rely on ordering side-effects.  Instead,
please explicitly declare the dependency for the helper or see if the
dependency can be eliminated if it is inappropriate.

Stefan


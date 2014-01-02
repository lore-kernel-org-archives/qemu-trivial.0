Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VyjXe-0005dp-5b
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jan 2014 09:46:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VyjXV-0005TI-0m
	for qemu-trivial@nongnu.org; Thu, 02 Jan 2014 09:46:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VyjXN-0002JD-Mg
	for qemu-trivial@nongnu.org; Thu, 02 Jan 2014 09:46:24 -0500
Received: from cantor2.suse.de ([195.135.220.15]:55255 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1VyjX8-0002Gz-OP; Thu, 02 Jan 2014 09:46:02 -0500
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 946B2AC11;
	Thu,  2 Jan 2014 14:46:00 +0000 (UTC)
Message-ID: <52C57BA5.101@suse.de>
Date: Thu, 02 Jan 2014 15:45:57 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1388464944-26911-1-git-send-email-keweihk@gmail.com>
	<52C5203F.1030408@redhat.com>
In-Reply-To: <52C5203F.1030408@redhat.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/1] qtest: Fix the bug
 about disabling vnc causes "make check" hang
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
X-List-Received-Date: Thu, 02 Jan 2014 14:46:32 -0000

Am 02.01.2014 09:15, schrieb Paolo Bonzini:
> Il 31/12/2013 05:42, Kewei Yu ha scritto:
>> When we disabling vnc from "./configure", the qemu can't use the vnc o=
ption.
>> So qtest can't use the "vnc -none ", otherwise "make check" will hang.
>>
>> Signed-off-by: Kewei Yu <keweihk@gmail.com>
>> ---
>>  v2: Consolidate VNC macro's #ifdef'ery to one central point (tests/li=
bqtest.c).
>=20
> What happens if qtest instead uses "-display none"?

It does use that, since the commit I pointed to in v1. :)

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg


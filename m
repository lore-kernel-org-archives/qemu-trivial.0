Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yugw1-0005mu-L9
	for mharc-qemu-trivial@gnu.org; Tue, 19 May 2015 08:47:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Yugvv-0005fH-UA
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 08:47:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Yugvr-0006aa-UN
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 08:47:43 -0400
Received: from cantor2.suse.de ([195.135.220.15]:34835 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Yugvl-0006Zp-Og; Tue, 19 May 2015 08:47:33 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id CAB01AD24;
	Tue, 19 May 2015 12:47:32 +0000 (UTC)
Message-ID: <555B30E3.6000605@suse.de>
Date: Tue, 19 May 2015 14:47:31 +0200
From: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE Linux GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, 
	Martin Cerveny <M.Cerveny@computer.org>
References: <1431519294-8873-1-git-send-email-M.Cerveny@computer.org>	<1431519294-8873-3-git-send-email-M.Cerveny@computer.org>	<55547221.4030109@redhat.com>	<alpine.GSO.2.00.1505141317030.24664@dmz.c-home.cz>
	<55548B65.2030204@redhat.com>
In-Reply-To: <55548B65.2030204@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] scripts: qom-tree: add
 support of path as argument
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
X-List-Received-Date: Tue, 19 May 2015 12:47:48 -0000

Am 14.05.2015 um 13:47 schrieb Paolo Bonzini:
> On 14/05/2015 13:41, Martin Cerveny wrote:
>> Hello.
>>
>> Ternary/if/else >=3D python 2.5 (I use the same coding as in
>> scripts/qmp/qemu-ga-client).
>=20
> Oh, that's old.  Shows my knowledge of Python.
>=20
> Then your patch is okay---thanks for enduring with me. :)

Thanks, applied to qom-next then:
https://github.com/afaerber/qemu-cpu/commits/qom-next

Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Dilip Upmanyu, Graham Norton; HRB
21284 (AG N=FCrnberg)


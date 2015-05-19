Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YuiGF-0005MK-5A
	for mharc-qemu-trivial@gnu.org; Tue, 19 May 2015 10:12:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <martin@c-home.cz>) id 1YuiG8-0005Eu-V2
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 10:12:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <martin@c-home.cz>) id 1YuiG4-0005P9-FX
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 10:12:40 -0400
Received: from gw.c-home.cz ([89.24.150.100]:54077 helo=dmz.c-home.cz)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <martin@c-home.cz>)
	id 1YuiFu-0005Ge-FV; Tue, 19 May 2015 10:12:26 -0400
Received: from dmz.c-home.cz (localhost [127.0.0.1])
	by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id t4JECGuD006500;
	Tue, 19 May 2015 16:12:16 +0200 (CEST)
Received: from localhost (martin@localhost)
	by dmz.c-home.cz (8.14.4+Sun/8.14.4/Submit) with ESMTP id
	t4JECFwU006497; Tue, 19 May 2015 16:12:15 +0200 (CEST)
X-Authentication-Warning: dmz.c-home.cz: martin owned process doing -bs
Date: Tue, 19 May 2015 16:12:15 +0200 (CEST)
From: Martin Cerveny <martin@c-home.cz>
To: Eric Blake <eblake@redhat.com>
In-Reply-To: <555B4127.4030700@redhat.com>
Message-ID: <alpine.GSO.2.00.1505191601120.6069@dmz.c-home.cz>
References: <1431519294-8873-1-git-send-email-M.Cerveny@computer.org>
	<1431519294-8873-2-git-send-email-M.Cerveny@computer.org>
	<555B31D9.2090806@suse.de> <555B4127.4030700@redhat.com>
User-Agent: Alpine 2.00 (GSO 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-559023410-2022861571-1432044736=:6069"
X-detected-operating-system: by eggs.gnu.org: Solaris 10
X-Received-From: 89.24.150.100
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>,
	Martin Cerveny <M.Cerveny@computer.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] scripts: qom-*: add
	network syntax
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: Martin Cerveny <M.Cerveny@computer.org>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 May 2015 14:12:45 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---559023410-2022861571-1432044736=:6069
Content-Type: TEXT/PLAIN; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by dmz.c-home.cz id t4JECGuD006500

Hello.

On Tue, 19 May 2015, Eric Blake wrote:
> On 05/19/2015 06:51 AM, Andreas F=C3=A4rber wrote:
>> Am 13.05.2015 um 14:14 schrieb Martin Cerveny:
>>> Add network syntax parsing (ip address, port) to qom-* scripts.
>>>
>>> Signed-off-by: Martin Cerveny <M.Cerveny@computer.org>
>>> ---
>>>  scripts/qmp/qom-fuse |   13 ++++++++++++-
>>>  scripts/qmp/qom-get  |   12 +++++++++++-
>>>  scripts/qmp/qom-list |   12 +++++++++++-
>>>  scripts/qmp/qom-set  |   12 +++++++++++-
>>>  scripts/qmp/qom-tree |   12 +++++++++++-
>>>  5 files changed, 56 insertions(+), 5 deletions(-)
>>
>> Could some Python guru please take a look at this?
>
> That disqualifies me (still a python newbie), but I still see something
> questionable:
>
>>>
>>> -srv =3D QEMUMonitorProtocol(socket_path)
>>> +connection =3D socket_path.split(':')
>>> +if len(connection) =3D=3D 2:
>>> +    try:
>>> +         port =3D int(connection[1])
>>> +    except ValueError:
>>> +         raise QMPBadPort
>>> +    connection =3D ( connection[0], port )
>
> Won't that mishandle IPv6 connections, such as something like [::1]:800=
0
> for connecting to port 8000 on localhost, since it splits into more tha=
n
> 2 pieces when splitting on :?

Yes, this is problem, but I copy-paste the same construct from=20
scripts/qmp/qmp-shell to be compatible.
Is the IPv6 support for utilities mandatory ?
If yes I can make V2.

M.C>
---559023410-2022861571-1432044736=:6069--


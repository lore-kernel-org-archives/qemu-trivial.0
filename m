Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TylXE-00035I-Fv
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2013 10:49:44 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TylXC-0002zL-5r
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 10:49:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TylXB-0001LS-2g
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 10:49:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55891)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1TylX3-0001Jq-Fq; Fri, 25 Jan 2013 10:49:33 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0PFnWar028553
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 25 Jan 2013 10:49:32 -0500
Received: from blackfin.pond.sub.org (ovpn-116-38.ams2.redhat.com
	[10.36.116.38])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r0PFnVVQ032208; Fri, 25 Jan 2013 10:49:32 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 27383200AA; Fri, 25 Jan 2013 16:49:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <ef9bb01f7a2cd566bcdc10f19dc0881818754c4e.1359120428.git.mprivozn@redhat.com>
	<87zjzx2wpp.fsf@blackfin.pond.sub.org> <510291AE.6@redhat.com>
	<5102A77A.6070508@redhat.com>
Date: Fri, 25 Jan 2013 16:49:31 +0100
In-Reply-To: <5102A77A.6070508@redhat.com> (Eric Blake's message of "Fri, 25
	Jan 2013 08:40:42 -0700")
Message-ID: <87ham51cvo.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-commands.hx:
	s/tray-open/tray_open/ to match qapi schema
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
X-List-Received-Date: Fri, 25 Jan 2013 15:49:43 -0000

Eric Blake <eblake@redhat.com> writes:

> On 01/25/2013 07:07 AM, Michal Privoznik wrote:
>> On 25.01.2013 14:55, Markus Armbruster wrote:
>>> Michal Privoznik <mprivozn@redhat.com> writes:
>>>
>>>> Currently, we are using 'tray_open' in QMP and 'tray-open' in
>>>> HMP. However, the QMP documentation was mistakenly using the
>>>> HMP version.
>>>
>>> Could you point me to where we're using "tray_open"?
>>>
>> 
>> qemu.git $ git grep -npC8 tray_open qapi-schema.json
>> 
>
>> qapi-schema.json-705-{ 'type': 'BlockInfo',
>> qapi-schema.json-706- 'data': {'device': 'str', 'type': 'str',
>> removable': 'bool',
>> qapi-schema.json-707- 'locked': 'bool', '*inserted':
>> BlockDeviceInfo',
>> qapi-schema.json:708: '*tray_open': 'bool', '*io-status':
>> BlockDeviceIoStatus',
>> qapi-schema.json-709-           '*dirty': 'BlockDirtyInfo' } }
>
> And since existing qemu versions output tray_open, we would be breaking
> API if we fixed the QMP to return tray-open (libvirt could cope with
> that API break by checking both spellings, but that feels dirty).

Breaking the API is out of the question.

We suck at consistency :(


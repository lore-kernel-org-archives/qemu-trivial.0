Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzNp7-00019x-Q9
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2015 07:24:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YzNp5-00017Z-MH
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 07:24:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YzNp4-0002CL-Nr
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 07:24:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56701)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YzNov-000274-JB; Mon, 01 Jun 2015 07:23:53 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 4065A3679F9;
	Mon,  1 Jun 2015 11:23:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t51BNp6m011624
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 1 Jun 2015 07:23:52 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id CC17330408A8; Mon,  1 Jun 2015 13:23:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1432811743-2423-1-git-send-email-mjt@msgid.tls.msk.ru>
	<87bngzluvg.fsf@blackfin.pond.sub.org>
	<556C1B70.3060209@msgid.tls.msk.ru>
Date: Mon, 01 Jun 2015 13:23:50 +0200
In-Reply-To: <556C1B70.3060209@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Mon, 01 Jun 2015 11:44:32 +0300")
Message-ID: <87382bekop.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: pmatouse@redhat.com, P J P <pjp@fedoraproject.org>, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel@nongnu.org,
	Miroslav Rezanina <mrezanin@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: use less predictable
	directory name in /tmp for smb config (CVE-2015-4037)
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
X-List-Received-Date: Mon, 01 Jun 2015 11:24:04 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 01.06.2015 11:01, Markus Armbruster wrote:
> []
>>> -    snprintf(s->smb_dir, sizeof(s->smb_dir), "/tmp/qemu-smb.%ld-%d",
>>> -             (long)getpid(), instance++);
>>> -    if (mkdir(s->smb_dir, 0700) < 0) {
>>> +    strcpy(s->smb_dir, "/tmp/qemu-smb.XXXXXX");
>>> +    if (!mkdtemp(s->smb_dir)) {
>>>          error_report("could not create samba server dir '%s'", s->smb_dir);
>>>          return -1;
>>>      }
>> 
>> Uh, I have to suspend my R-by.  This clobbers s->smb_dir[] when
>> mkdtemp() fails.  Is that safe?  Explain why, and get my R-by back.
>
> At least this is not different from the original behavour.

Fair enough, R-by unsuspended.

> The only place where this variable is used is in the slirp_smb_cleanup()
> function, which, if smb_dir[0] != 0, does rm -rf on it.
> I think it will be better to add s->smb_dir[0] = 0 here before return.

Makes sense.

> On the other hand this isn't really that important given when we can
> expect mkdtemp() to fail.

Not sure I got this part.  Not sure I need to :)


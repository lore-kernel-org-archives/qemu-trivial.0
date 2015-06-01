Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzLL8-0006SK-DB
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2015 04:44:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YzLL5-0006P0-Sr
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 04:44:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YzLL5-0003ws-1f
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 04:44:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53740)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YzLKx-0003sh-C6; Mon, 01 Jun 2015 04:44:47 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9253D40121;
	Mon,  1 Jun 2015 11:44:32 +0300 (MSK)
Message-ID: <556C1B70.3060209@msgid.tls.msk.ru>
Date: Mon, 01 Jun 2015 11:44:32 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1432811743-2423-1-git-send-email-mjt@msgid.tls.msk.ru>
	<87bngzluvg.fsf@blackfin.pond.sub.org>
In-Reply-To: <87bngzluvg.fsf@blackfin.pond.sub.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: pmatouse@redhat.com, P J P <pjp@fedoraproject.org>, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel@nongnu.org,
	Miroslav Rezanina <mrezanin@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] slirp: use less predictable directory
 name in /tmp for smb config (CVE-2015-4037)
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
X-List-Received-Date: Mon, 01 Jun 2015 08:44:56 -0000

01.06.2015 11:01, Markus Armbruster wrote:
[]
>> -    snprintf(s->smb_dir, sizeof(s->smb_dir), "/tmp/qemu-smb.%ld-%d",
>> -             (long)getpid(), instance++);
>> -    if (mkdir(s->smb_dir, 0700) < 0) {
>> +    strcpy(s->smb_dir, "/tmp/qemu-smb.XXXXXX");
>> +    if (!mkdtemp(s->smb_dir)) {
>>          error_report("could not create samba server dir '%s'", s->smb_dir);
>>          return -1;
>>      }
> 
> Uh, I have to suspend my R-by.  This clobbers s->smb_dir[] when
> mkdtemp() fails.  Is that safe?  Explain why, and get my R-by back.

At least this is not different from the original behavour.

The only place where this variable is used is in the slirp_smb_cleanup()
function, which, if smb_dir[0] != 0, does rm -rf on it.
I think it will be better to add s->smb_dir[0] = 0 here before return.
On the other hand this isn't really that important given when we can
expect mkdtemp() to fail.

Thanks,

/mjt


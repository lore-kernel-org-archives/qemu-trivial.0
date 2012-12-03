Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TfVxp-0003w2-RX
	for mharc-qemu-trivial@gnu.org; Mon, 03 Dec 2012 08:21:37 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TfVxn-0003n0-8a
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2012 08:21:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TfVxh-0008FN-Hk
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2012 08:21:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:61910)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1TfVxa-0008EU-AS; Mon, 03 Dec 2012 08:21:22 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qB3DLDA7004675
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 3 Dec 2012 08:21:19 -0500
Received: from blackfin.pond.sub.org (ovpn-116-18.ams2.redhat.com
	[10.36.116.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qB3DLDMU010850; Mon, 3 Dec 2012 08:21:13 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 67ABA2009D; Mon,  3 Dec 2012 14:21:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1353694338-13162-1-git-send-email-armbru@redhat.com>
	<1353694338-13162-2-git-send-email-armbru@redhat.com>
	<20121203130553.GG6048@stefanha-thinkpad.redhat.com>
Date: Mon, 03 Dec 2012 14:21:12 +0100
In-Reply-To: <20121203130553.GG6048@stefanha-thinkpad.redhat.com> (Stefan
	Hajnoczi's message of "Mon, 3 Dec 2012 14:05:53 +0100")
Message-ID: <87sj7nz2yf.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, jordan.l.justen@intel.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/2] pc_sysfw: Check for qemu_find_file()
	failure
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
X-List-Received-Date: Mon, 03 Dec 2012 13:21:36 -0000

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Fri, Nov 23, 2012 at 07:12:17PM +0100, Markus Armbruster wrote:
>> diff --git a/hw/pc_sysfw.c b/hw/pc_sysfw.c
>> index 9d7c5f4..066c4fe 100644
>> --- a/hw/pc_sysfw.c
>> +++ b/hw/pc_sysfw.c
>> @@ -84,6 +84,11 @@ static void pc_fw_add_pflash_drv(void)
>>          bios_name = BIOS_FILENAME;
>>      }
>>      filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
>> +    if (!filename) {
>> +        error_report("Can't open BIOS image %s: %s",
>> +                     bios_name, strerror(errno));
>
> qemu_find_file() does not document that errno is set when returning
> NULL.  I can't find other callers to qemu_find_file() that use errno
> either.
>
> Please add a doc comment to qemu_find_file() that errno will be set on
> NULL return, otherwise we can't rely on it in the caller.

Good point, v2 coming.


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2Luz-0004la-Mn
	for mharc-qemu-trivial@gnu.org; Fri, 27 Nov 2015 11:30:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a2Lus-0004eI-KH
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 11:30:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a2Lun-0001UY-1k
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 11:30:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37252)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a2Luh-0001Tu-49; Fri, 27 Nov 2015 11:30:23 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id A9B61E7097;
	Fri, 27 Nov 2015 16:30:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-61.ams2.redhat.com
	[10.36.116.61])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tARGUKY3019641
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 27 Nov 2015 11:30:22 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3CF9F303F16C; Fri, 27 Nov 2015 17:30:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1448626105-29540-1-git-send-email-pbonzini@redhat.com>
	<87oaefzeuh.fsf@blackfin.pond.sub.org> <56586B7D.2040205@redhat.com>
	<877fl3v5fm.fsf@blackfin.pond.sub.org> <56588168.2070003@redhat.com>
Date: Fri, 27 Nov 2015 17:30:20 +0100
In-Reply-To: <56588168.2070003@redhat.com> (Paolo Bonzini's message of "Fri,
	27 Nov 2015 17:14:32 +0100")
Message-ID: <87poyvpfqb.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.5] bt: fix two struct
	sizes
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
X-List-Received-Date: Fri, 27 Nov 2015 16:30:39 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 27/11/2015 16:16, Markus Armbruster wrote:
>>>> >> Since you also fix RESET_FAILED_CONTACT_COUNTER_RP_SIZE, I assume you
>>>> >> checked them all.
>>>> >> 
>>>> >> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>> >
>>> > No, I just copied the upstream bluez patch.
>> At least CREATE_CONN_CANCEL_CP_SIZE is also wrong.
>> 
>> Any particular reason not to mass-convert to sizeof and call it a day?
>
> No particular reason, but it is bluetooth after all. :)

Okay, no need to say more.

A bit of Emacs wizardry produced a test program, which coughed up three
more:

type                            sizeof()  _SIZE
create_conn_cancel_cp                  7      6
reset_failed_contact_counter_rp        3      4
read_link_quality_cp                   2      4
inquiry_info                          15     14
evt_encrypt_change                     4      5

I'll send a patch.


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2N2H-0005QW-Ke
	for mharc-qemu-trivial@gnu.org; Fri, 27 Nov 2015 12:42:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a2N2F-0005Nd-6m
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 12:42:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a2N2E-0005Cf-GV
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 12:42:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a2N2A-0005Bw-4Z; Fri, 27 Nov 2015 12:42:10 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 86A84A92;
	Fri, 27 Nov 2015 17:42:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-61.ams2.redhat.com
	[10.36.116.61])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tARHg7e5002780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 27 Nov 2015 12:42:09 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0F5B0303F16C; Fri, 27 Nov 2015 18:42:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1448626105-29540-1-git-send-email-pbonzini@redhat.com>
	<87oaefzeuh.fsf@blackfin.pond.sub.org> <56586B7D.2040205@redhat.com>
	<877fl3v5fm.fsf@blackfin.pond.sub.org> <56588168.2070003@redhat.com>
	<87poyvpfqb.fsf@blackfin.pond.sub.org>
	<87h9k7nze2.fsf@blackfin.pond.sub.org> <56589313.80401@redhat.com>
Date: Fri, 27 Nov 2015 18:42:07 +0100
In-Reply-To: <56589313.80401@redhat.com> (Paolo Bonzini's message of "Fri, 27
	Nov 2015 18:29:55 +0100")
Message-ID: <87two7jq4w.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
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
X-List-Received-Date: Fri, 27 Nov 2015 17:42:16 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 27/11/2015 18:08, Markus Armbruster wrote:
>>> > evt_encrypt_change                     4      5
>> Used in bt_hci_event_encrypt_change().  I figure it makes bt_hci_event()
>> overrun the destination by one byte.
>
> Yes, and Coverity complains.
>
>> Kernel has
>> 
>>     struct hci_ev_encrypt_change {
>>             __u8     status;
>>             __le16   handle;
>>             __u8     encrypt;
>>     } __packed;
>> 
>> You changed this one.  Plausible, but I don't want to have my R-by on it
>> all the same.
>
> Shall I proceed with this patch, just without R-by?  Or only modify the
> one where Coverity complains?  I picked this one because it matches a
> bluez patch.

Yes, that seems to make the most sense.  If you feel like it, add a
sentence or two on the ones you don't fix to the commit message.


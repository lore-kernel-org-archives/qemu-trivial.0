Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2MqZ-0006yV-B4
	for mharc-qemu-trivial@gnu.org; Fri, 27 Nov 2015 12:30:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a2MqW-0006th-5v
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 12:30:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a2MqV-00020M-Dc
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 12:30:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44876)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1a2MqN-0001tz-BP; Fri, 27 Nov 2015 12:29:59 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 18E32C0B7AAD;
	Fri, 27 Nov 2015 17:29:59 +0000 (UTC)
Received: from [10.36.112.19] (ovpn-112-19.ams2.redhat.com [10.36.112.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tARHTuDM021370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 Nov 2015 12:29:57 -0500
To: Markus Armbruster <armbru@redhat.com>
References: <1448626105-29540-1-git-send-email-pbonzini@redhat.com>
	<87oaefzeuh.fsf@blackfin.pond.sub.org> <56586B7D.2040205@redhat.com>
	<877fl3v5fm.fsf@blackfin.pond.sub.org> <56588168.2070003@redhat.com>
	<87poyvpfqb.fsf@blackfin.pond.sub.org>
	<87h9k7nze2.fsf@blackfin.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56589313.80401@redhat.com>
Date: Fri, 27 Nov 2015 18:29:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <87h9k7nze2.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
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
X-List-Received-Date: Fri, 27 Nov 2015 17:30:09 -0000



On 27/11/2015 18:08, Markus Armbruster wrote:
>> > evt_encrypt_change                     4      5
> Used in bt_hci_event_encrypt_change().  I figure it makes bt_hci_event()
> overrun the destination by one byte.

Yes, and Coverity complains.

> Kernel has
> 
>     struct hci_ev_encrypt_change {
>             __u8     status;
>             __le16   handle;
>             __u8     encrypt;
>     } __packed;
> 
> You changed this one.  Plausible, but I don't want to have my R-by on it
> all the same.

Shall I proceed with this patch, just without R-by?  Or only modify the
one where Coverity complains?  I picked this one because it matches a
bluez patch.

Paolo


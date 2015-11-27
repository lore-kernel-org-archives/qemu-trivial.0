Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2MVt-0008EP-Rv
	for mharc-qemu-trivial@gnu.org; Fri, 27 Nov 2015 12:08:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a2MVr-0008Ci-8B
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 12:08:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a2MVq-0003xO-AO
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 12:08:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55783)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a2MVk-0003wh-18; Fri, 27 Nov 2015 12:08:40 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 9CF0412BBE;
	Fri, 27 Nov 2015 17:08:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-61.ams2.redhat.com
	[10.36.116.61])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tARH8b4k003402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 27 Nov 2015 12:08:39 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 663C3303F16C; Fri, 27 Nov 2015 18:08:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1448626105-29540-1-git-send-email-pbonzini@redhat.com>
	<87oaefzeuh.fsf@blackfin.pond.sub.org> <56586B7D.2040205@redhat.com>
	<877fl3v5fm.fsf@blackfin.pond.sub.org> <56588168.2070003@redhat.com>
	<87poyvpfqb.fsf@blackfin.pond.sub.org>
Date: Fri, 27 Nov 2015 18:08:37 +0100
In-Reply-To: <87poyvpfqb.fsf@blackfin.pond.sub.org> (Markus Armbruster's
	message of "Fri, 27 Nov 2015 17:30:20 +0100")
Message-ID: <87h9k7nze2.fsf@blackfin.pond.sub.org>
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
X-List-Received-Date: Fri, 27 Nov 2015 17:08:48 -0000

Markus Armbruster <armbru@redhat.com> writes:

> Paolo Bonzini <pbonzini@redhat.com> writes:
>
>> On 27/11/2015 16:16, Markus Armbruster wrote:
>>>>> >> Since you also fix RESET_FAILED_CONTACT_COUNTER_RP_SIZE, I assume you
>>>>> >> checked them all.
>>>>> >> 
>>>>> >> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Retracted.

>>>> > No, I just copied the upstream bluez patch.
>>> At least CREATE_CONN_CANCEL_CP_SIZE is also wrong.
>>> 
>>> Any particular reason not to mass-convert to sizeof and call it a day?
>>
>> No particular reason, but it is bluetooth after all. :)
>
> Okay, no need to say more.
>
> A bit of Emacs wizardry produced a test program, which coughed up three
> more:
>
> type                            sizeof()  _SIZE
> create_conn_cancel_cp                  7      6

Unused in QEMU.

The closest match I can find in the kernel's current
include/net/bluetooth/hci.h is

    #define HCI_OP_CREATE_CONN_CANCEL       0x0408
    struct hci_cp_create_conn_cancel {
            bdaddr_t bdaddr;
    } __packed;

Size 6, QEMU has an additional first member that brings it to size 7.
Pffft, I'm not going to touch this crap.

> reset_failed_contact_counter_rp        3      4

Unused in QEMU.  Can't match to the kernel's header.  You changed this
one.  I wouldn't touch it.

> read_link_quality_cp                   2      4

Unused in QEMU.  Can't match to the kernel's header.  I'm not going to
touch it.

> inquiry_info                          15     14

Used in bt_hci_inquiry_result_standard().  I figure bt_hci_event() will
leave the last byte uninitialized.

Kernel has

    struct inquiry_info {
            bdaddr_t bdaddr;
            __u8     pscan_rep_mode;
            __u8     pscan_period_mode;
            __u8     pscan_mode;
            __u8     dev_class[3];
            __le16   clock_offset;
    } __packed;

Size 14, QEMU has an additional first member that brings it to size 15.
I'm not going to touch it.

> evt_encrypt_change                     4      5

Used in bt_hci_event_encrypt_change().  I figure it makes bt_hci_event()
overrun the destination by one byte.

Kernel has

    struct hci_ev_encrypt_change {
            __u8     status;
            __le16   handle;
            __u8     encrypt;
    } __packed;

You changed this one.  Plausible, but I don't want to have my R-by on it
all the same.

> I'll send a patch.

No, I won't.  The only patch I could be persuaded to send would drop the
whole thing with prejudice.


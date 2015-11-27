Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2KBP-00060V-E3
	for mharc-qemu-trivial@gnu.org; Fri, 27 Nov 2015 09:39:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a2KBM-0005wf-Bt
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 09:39:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a2KBL-00051d-EK
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 09:39:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38844)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a2KBF-0004z8-Aa; Fri, 27 Nov 2015 09:39:21 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id CB25A8F4EF;
	Fri, 27 Nov 2015 14:39:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-61.ams2.redhat.com
	[10.36.116.61])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAREdJEi004573
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 27 Nov 2015 09:39:20 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A487F303F16C; Fri, 27 Nov 2015 15:39:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1448626105-29540-1-git-send-email-pbonzini@redhat.com>
Date: Fri, 27 Nov 2015 15:39:18 +0100
In-Reply-To: <1448626105-29540-1-git-send-email-pbonzini@redhat.com> (Paolo
	Bonzini's message of "Fri, 27 Nov 2015 13:08:24 +0100")
Message-ID: <87oaefzeuh.fsf@blackfin.pond.sub.org>
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
X-List-Received-Date: Fri, 27 Nov 2015 14:39:29 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> See http://permalink.gmane.org/gmane.linux.bluez.kernel/36505.  For historical
> reasons these do not use sizeof, and Coverity caught a mistake in
> EVT_ENCRYPT_CHANGE_SIZE.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/hw/bt.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/bt.h b/include/hw/bt.h
> index cb2a7e6..bbea104 100644
> --- a/include/hw/bt.h
> +++ b/include/hw/bt.h
> @@ -1266,7 +1266,7 @@ typedef struct {
>      uint8_t	status;
>      uint16_t	handle;
>  } QEMU_PACKED reset_failed_contact_counter_rp;
> -#define RESET_FAILED_CONTACT_COUNTER_RP_SIZE 4
> +#define RESET_FAILED_CONTACT_COUNTER_RP_SIZE 3
>  
>  #define OCF_READ_LINK_QUALITY		0x0003
>  typedef struct {
> @@ -1381,7 +1381,7 @@ typedef struct {
>      uint16_t	handle;
>      uint8_t	encrypt;
>  } QEMU_PACKED evt_encrypt_change;
> -#define EVT_ENCRYPT_CHANGE_SIZE 5
> +#define EVT_ENCRYPT_CHANGE_SIZE 4
>  
>  #define EVT_CHANGE_CONN_LINK_KEY_COMPLETE	0x09
>  typedef struct {

Yuck!

Since you also fix RESET_FAILED_CONTACT_COUNTER_RP_SIZE, I assume you
checked them all.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


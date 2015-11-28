Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2hCR-0005GG-QL
	for mharc-qemu-trivial@gnu.org; Sat, 28 Nov 2015 10:14:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1a2hCP-0005D7-Hx
	for qemu-trivial@nongnu.org; Sat, 28 Nov 2015 10:14:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1a2hCL-0003pp-GA
	for qemu-trivial@nongnu.org; Sat, 28 Nov 2015 10:14:05 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:33793)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1a2hCL-0003o9-9V; Sat, 28 Nov 2015 10:14:01 -0500
Received: by wmvv187 with SMTP id v187so102551240wmv.1;
	Sat, 28 Nov 2015 07:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=viBtgYbPjhsArD9zQmmnT66Whyt/PDG5pxrziIuJdGU=;
	b=UiV52acn3M+uLyt7WZwbaS/Wt4F06/6OKbyXQmpFn4KdM0b8czhbfO8cIou7P7M/8C
	ujWe6bosqfstl3Pas9A5hQkTSFM0qIMtVPLQuC6d76G1CtYbHp7jEOUTPNprnjAZ0ks0
	zChYooUmXeWlyn88cFJ9/RJbMTf1+yE18FP1hkEgAGT8Nt0V9vdlkNm0MmUM13NRrnCO
	rIXfEd9fyPDacTb7GUWG+vpn7HhS09BGTncvJ8IL5ESPZudAiqqDt2Kvce6vdzTXTxZc
	LdZh9XI8SSLQXbkvo2VKeuETN9hOKMBpXp9oJ5Y3K0fR27PI+tR8YlfOoMn4k2zCaVl3
	OyVQ==
X-Received: by 10.28.227.198 with SMTP id a189mr16874938wmh.74.1448723639981; 
	Sat, 28 Nov 2015 07:13:59 -0800 (PST)
Received: from [192.168.10.165] (94-39-152-11.adsl-ull.clienti.tiscali.it.
	[94.39.152.11]) by smtp.googlemail.com with ESMTPSA id
	n7sm12525526wmf.21.2015.11.28.07.13.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Nov 2015 07:13:58 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: qemu-devel@nongnu.org
References: <1448647022-8379-1-git-send-email-pbonzini@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5659C4B5.8030108@redhat.com>
Date: Sat, 28 Nov 2015 16:13:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1448647022-8379-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::233
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] bt: check struct sizes
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
X-List-Received-Date: Sat, 28 Nov 2015 15:14:06 -0000



On 27/11/2015 18:57, Paolo Bonzini wrote:
> See http://permalink.gmane.org/gmane.linux.bluez.kernel/36505.  For historical
> reasons these do not use sizeof, and Coverity caught a mistake in
> EVT_ENCRYPT_CHANGE_SIZE.
> 
> Note other sizes that seem wrong or inconsistent with the kernel header.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Hmm, can do better...

Paolo

> ---
>  include/hw/bt.h | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/bt.h b/include/hw/bt.h
> index cb2a7e6..bc32807 100644
> --- a/include/hw/bt.h
> +++ b/include/hw/bt.h
> @@ -507,6 +507,7 @@ typedef struct {
>      uint8_t	status;
>      bdaddr_t	bdaddr;
>  } QEMU_PACKED create_conn_cancel_cp;
> +/* FIXME: 6 or 7? Kernel doesn't have status??  */
>  #define CREATE_CONN_CANCEL_CP_SIZE 6
>  
>  typedef struct {
> @@ -1266,12 +1267,13 @@ typedef struct {
>      uint8_t	status;
>      uint16_t	handle;
>  } QEMU_PACKED reset_failed_contact_counter_rp;
> -#define RESET_FAILED_CONTACT_COUNTER_RP_SIZE 4
> +#define RESET_FAILED_CONTACT_COUNTER_RP_SIZE 3
>  
>  #define OCF_READ_LINK_QUALITY		0x0003
>  typedef struct {
>      uint16_t	handle;
>  } QEMU_PACKED read_link_quality_cp;
> +/* FIXME: 2 or 4?? */
>  #define READ_LINK_QUALITY_CP_SIZE 4
>  
>  typedef struct {
> @@ -1332,6 +1334,7 @@ typedef struct {
>      uint8_t	dev_class[3];
>      uint16_t	clock_offset;
>  } QEMU_PACKED inquiry_info;
> +/* FIXME: 15 or 14??  Kernel doesn't have num_responses.  */
>  #define INQUIRY_INFO_SIZE 14
>  
>  #define EVT_CONN_COMPLETE		0x03
> @@ -1381,7 +1384,7 @@ typedef struct {
>      uint16_t	handle;
>      uint8_t	encrypt;
>  } QEMU_PACKED evt_encrypt_change;
> -#define EVT_ENCRYPT_CHANGE_SIZE 5
> +#define EVT_ENCRYPT_CHANGE_SIZE 4
>  
>  #define EVT_CHANGE_CONN_LINK_KEY_COMPLETE	0x09
>  typedef struct {
> @@ -1570,6 +1573,7 @@ typedef struct {
>      uint16_t	clock_offset;
>      int8_t	rssi;
>  } QEMU_PACKED inquiry_info_with_rssi;
> +/* FIXME: 15 or 14??  Kernel doesn't have num_responses.  */
>  #define INQUIRY_INFO_WITH_RSSI_SIZE 15
>  typedef struct {
>      uint8_t	num_responses;
> @@ -1581,6 +1585,7 @@ typedef struct {
>      uint16_t	clock_offset;
>      int8_t	rssi;
>  } QEMU_PACKED inquiry_info_with_rssi_and_pscan_mode;
> +/* FIXME: 16 or 15??  Kernel doesn't have num_responses.  */
>  #define INQUIRY_INFO_WITH_RSSI_AND_PSCAN_MODE_SIZE 16
>  
>  #define EVT_READ_REMOTE_EXT_FEATURES_COMPLETE	0x23
> @@ -1639,6 +1644,7 @@ typedef struct {
>      int8_t	rssi;
>      uint8_t	data[240];
>  } QEMU_PACKED extended_inquiry_info;
> +/* FIXME: 254 or 255??  Should there be num_responses here too?  */
>  #define EXTENDED_INQUIRY_INFO_SIZE 254
>  
>  #define EVT_TESTING			0xFE
> 


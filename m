Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RQH8H-0003Ta-QX
	for mharc-qemu-trivial@gnu.org; Tue, 15 Nov 2011 06:24:53 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1RQH8C-0003SW-T3
	for qemu-trivial@nongnu.org; Tue, 15 Nov 2011 06:24:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1RQH87-0001pC-Oi
	for qemu-trivial@nongnu.org; Tue, 15 Nov 2011 06:24:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50045)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1RQH87-0001om-26; Tue, 15 Nov 2011 06:24:43 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pAFBOfI0015333
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 15 Nov 2011 06:24:41 -0500
Received: from garlic.redhat.com (vpn-201-97.tlv.redhat.com [10.35.201.97])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pAFBOaEB003897
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Tue, 15 Nov 2011 06:24:39 -0500
Date: Tue, 15 Nov 2011 13:24:36 +0200
From: Alon Levy <alevy@redhat.com>
To: matthias.bgg@googlemail.com
Message-ID: <20111115112436.GK7140@garlic.redhat.com>
Mail-Followup-To: matthias.bgg@googlemail.com, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Matthias Brugger <matthias.bgg@gmail.com>
References: <1321358234-14229-1-git-send-email-matthias.bgg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1321358234-14229-1-git-send-email-matthias.bgg@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Matthias Brugger <matthias.bgg@gmail.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fixing some spelling in
	docs/libcacard.txt
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
X-List-Received-Date: Tue, 15 Nov 2011 11:24:52 -0000

On Tue, Nov 15, 2011 at 11:57:14AM +0000, matthias.bgg@googlemail.com wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 

Thanks!

Reviewed-by: Alon Levy <alevy@redhat.com>

> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  docs/libcacard.txt |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/libcacard.txt b/docs/libcacard.txt
> index 5dee6fa..576af57 100644
> --- a/docs/libcacard.txt
> +++ b/docs/libcacard.txt
> @@ -170,7 +170,7 @@ public entry point:
>                                 int cert_count);
>  
>    The parameters for this are:
> -  card       - the virtual card structure which will prepresent this card.
> +  card       - the virtual card structure which will represent this card.
>    flags      - option flags that may be specific to this card type.
>    cert       - array of binary certificates.
>    cert_len   - array of lengths of each of the certificates specified in cert.
> @@ -179,7 +179,7 @@ public entry point:
>    cert_count - number of entries in cert, cert_len, and key arrays.
>  
>    Any cert, cert_len, or key with the same index are matching sets. That is
> -  cert[0] is cert_len[0] long and has the corresponsing private key of key[0].
> +  cert[0] is cert_len[0] long and has the corresponding private key of key[0].
>  
>  The card type emulator is expected to own the VCardKeys, but it should copy
>  any raw cert data it wants to save. It can create new applets and add them to
> @@ -261,7 +261,7 @@ Prior to processing calling the card type emulator's VCardProcessAPDU function,
>     apdu->a_Le   - The expected length of any returned data.
>     apdu->a_cla  - The raw apdu class.
>     apdu->a_channel - The channel (decoded from the class).
> -   apdu->a_secure_messaging_type - The decoded secure messagin type
> +   apdu->a_secure_messaging_type - The decoded secure messaging type
>                                     (from class).
>     apdu->a_type - The decode class type.
>     apdu->a_gen_type - the generic class type (7816, PROPRIETARY, RFU, PTS).
> @@ -273,7 +273,7 @@ Creating a Response --
>  
>  The expected result of any APDU call is a response. The card type emulator must
>  set *response with an appropriate VCardResponse value if it returns VCARD_DONE.
> -Reponses could be as simple as returning a 2 byte status word response, to as
> +Responses could be as simple as returning a 2 byte status word response, to as
>  complex as returning a block of data along with a 2 byte response. Which is
>  returned will depend on the semantics of the APDU. The following functions will
>  create card responses.
> @@ -282,12 +282,12 @@ create card responses.
>  
>      This is the most basic function to get a response. This function will
>      return a response the consists soley one 2 byte status code. If that status
> -    code is defined in card_7816t.h, then this function is guarrenteed to
> +    code is defined in card_7816t.h, then this function is guaranteed to
>      return a response with that status. If a cart type specific status code
>      is passed and vcard_make_response fails to allocate the appropriate memory
>      for that response, then vcard_make_response will return a VCardResponse
>      of VCARD7816_STATUS_EXC_ERROR_MEMORY. In any case, this function is
> -    guarrenteed to return a valid VCardResponse.
> +    guaranteed to return a valid VCardResponse.
>  
>          VCardResponse *vcard_response_new(unsigned char *buf, int len,
>                                            VCard7816Status status);
> -- 
> 1.7.1
> 
> 


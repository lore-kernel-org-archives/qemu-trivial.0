Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1eJ8-0008Gd-Cl
	for mharc-qemu-trivial@gnu.org; Sun, 26 Feb 2012 08:38:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1S1eJ1-0008Fo-Qh
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 08:38:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1S1eIt-00055n-UG
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 08:38:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:61567)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1S1eIt-00055b-M2; Sun, 26 Feb 2012 08:38:19 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1QDcHoI023854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sun, 26 Feb 2012 08:38:17 -0500
Received: from garlic.redhat.com (spice-ovirt.tlv.redhat.com [10.35.4.71])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1QDcDP0005609
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Sun, 26 Feb 2012 08:38:16 -0500
Date: Sun, 26 Feb 2012 14:38:12 +0100
From: Alon Levy <alevy@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120226133812.GC7395@garlic.redhat.com>
Mail-Followup-To: Stefan Weil <sw@weilnetz.de>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
References: <1330263021-1339-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1330263021-1339-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libcacard: Spelling and
 grammar fixes in documentation
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
X-List-Received-Date: Sun, 26 Feb 2012 13:38:32 -0000

On Sun, Feb 26, 2012 at 02:30:21PM +0100, Stefan Weil wrote:

Ack.

> * it's -> its
> 
> * it's -> it is (that's no fix, but makes future checks easier)
> 
> * this functions -> this function
> 
> * replacable -> replaceable
> 
> * reader's -> readers
> 
> * logins into -> logs into
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  docs/libcacard.txt |   22 +++++++++++-----------
>  1 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/libcacard.txt b/docs/libcacard.txt
> index f7d7519..559db8a 100644
> --- a/docs/libcacard.txt
> +++ b/docs/libcacard.txt
> @@ -10,7 +10,7 @@ such as signing, card removal/insertion, etc. are mapped to real, physical
>  cards which are shared with the client machine the emulator is running on, or
>  the cards could be pure software constructs.
>  
> -The emulator is structured to allow multiple replacable or additional pieces,
> +The emulator is structured to allow multiple replaceable or additional pieces,
>  so it can be easily modified for future requirements. The primary envisioned
>  modifications are:
>  
> @@ -32,7 +32,7 @@ be emulated as well, including PIV, newer versions of CAC, PKCS #15, etc.
>  --------------------
>  Replacing the Socket Based Virtual Reader Interface.
>  
> -The current implementation contains a replacable module vscclient.c. The
> +The current implementation contains a replaceable module vscclient.c. The
>  current vscclient.c implements a sockets interface to the virtual ccid reader
>  on the guest. CCID commands that are pertinent to emulation are passed
>  across the socket, and their responses are passed back along that same socket.
> @@ -42,7 +42,7 @@ implements a program with a main entry. It also handles argument parsing for
>  the emulator.
>  
>  An application that wants to use the virtual reader can replace vscclient.c
> -with it's own implementation that connects to it's own CCID reader.  The calls
> +with its own implementation that connects to its own CCID reader.  The calls
>  that the CCID reader can call are:
>  
>        VReaderList * vreader_get_reader_list();
> @@ -72,12 +72,12 @@ that the CCID reader can call are:
>        VReader * vreader_list_get_reader(VReaderListEntry *)
>  
>    This function returns the reader stored in the reader List entry. Caller gets
> -  a new reference to a reader. The caller must free it's reference when it is
> +  a new reference to a reader. The caller must free its reference when it is
>    finished with vreader_free().
>  
>        void vreader_free(VReader *reader);
>  
> -   This function frees a reference to a reader. Reader's are reference counted
> +   This function frees a reference to a reader. Readers are reference counted
>     and are automatically deleted when the last reference is freed.
>  
>        void vreader_list_delete(VReaderList *list);
> @@ -87,7 +87,7 @@ that the CCID reader can call are:
>  
>        VReaderStatus vreader_power_on(VReader *reader, char *atr, int *len);
>  
> -  This functions simulates a card power on. Virtual cards do not care about
> +  This function simulates a card power on. A virtual card does not care about
>    the actual voltage and other physical parameters, but it does care that the
>    card is actually on or off. Cycling the card causes the card to reset. If
>    the caller provides enough space, vreader_power_on will return the ATR of
> @@ -104,7 +104,7 @@ that the CCID reader can call are:
>                                         unsigned char *receive_buf,
>                                         int receive_buf_len);
>  
> -  This functions send a raw apdu to a card and returns the card's response.
> +  This function sends a raw apdu to a card and returns the card's response.
>    The CCID front end should return the response back. Most of the emulation
>    is driven from these APDUs.
>  
> @@ -217,10 +217,10 @@ the card using the following functions:
>           VCardStatus vcard_add_applet(VCard *card, VCardApplet *applet);
>  
>    Add an applet onto the list of applets attached to the card. Once an applet
> -  has been added, it can be selected by it's aid, and then commands will be
> +  has been added, it can be selected by its aid, and then commands will be
>    routed to it VCardProcessAPDU function. This function adopts the applet the
>    passed int applet. Note: 2 applets with the same AID should not be added to
> -  the same card. It's permissible to add more than one applet. Multiple applets
> +  the same card. It is permissible to add more than one applet. Multiple applets
>    may have the same VCardPRocessAPDU entry point.
>  
>  The certs and keys should be attached to private data associated with one or
> @@ -335,7 +335,7 @@ and applet.
>           VCard7816Status vcard_emul_login(VCard *card, unsigned char *pin,
>                                            int pin_len);
>  
> -    This function logins into the card and return the standard 7816 status
> +    This function logs into the card and returns the standard 7816 status
>      word depending on the success or failure of the call.
>  
>           void vcard_emul_delete_key(VCardKey *key);
> @@ -424,7 +424,7 @@ functions:
>        cert_len, and keys are all arrays of length cert_count. These are the
>        the same of the parameters xxxx_card_init() accepts.
>  
> -   Finally the card is associated with it's reader by the call:
> +   Finally the card is associated with its reader by the call:
>  
>              VReaderStatus vreader_insert_card(VReader *vreader, VCard *vcard);
>  
> -- 
> 1.7.9
> 
> 


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TyfVY-0005CU-Fl
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2013 04:23:36 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TyfVQ-0004oR-O5
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 04:23:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TyfVN-0001HN-90
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 04:23:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41644)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1TyfV7-0000y3-4R; Fri, 25 Jan 2013 04:23:09 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0P9N8Sv017800
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 25 Jan 2013 04:23:08 -0500
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0P9N7dR022169; Fri, 25 Jan 2013 04:23:07 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C6319200AA; Fri, 25 Jan 2013 10:23:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Tim Hardeck <thardeck@suse.de>
References: <1358961360-15623-1-git-send-email-armbru@redhat.com>
	<1359104210.6884.5.camel@Thinktank.site>
Date: Fri, 25 Jan 2013 10:23:06 +0100
In-Reply-To: <1359104210.6884.5.camel@Thinktank.site> (Tim Hardeck's message
	of "Fri, 25 Jan 2013 09:56:50 +0100")
Message-ID: <87obgdaa6d.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vnc: Clean up
	vncws_send_handshake_response()
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
X-List-Received-Date: Fri, 25 Jan 2013 09:23:35 -0000

Tim Hardeck <thardeck@suse.de> writes:

> Hi Markus,
>
> thanks for your input.
>
> On Wed, 2013-01-23 at 18:16 +0100, Markus Armbruster wrote:
>> Use appropriate types, drop superfluous casts, use sizeof, don't
>> exploit that this particular call of gnutls_fingerprint() doesn't
>> change its last argument.
>
> your patch does work fine but if we expect gnutls_fingerprint to change
> the hash_size there has to be an additional check if the hash_size is
> bigger than SHA1_DIGEST_LEN.
>
> For example:
>
> diff --git a/ui/vnc-ws.c b/ui/vnc-ws.c
> index de7e74c..e64c895 100644
> --- a/ui/vnc-ws.c
> +++ b/ui/vnc-ws.c
> @@ -132,7 +132,7 @@ static void vncws_send_handshake_response(VncState
> *vs, const char* key)
>      in.data = (void *)combined_key;
>      in.size = WS_CLIENT_KEY_LEN + WS_GUID_LEN;
>      if (gnutls_fingerprint(GNUTLS_DIG_SHA1, &in, hash, &hash_size)
> -            == GNUTLS_E_SUCCESS) {
> +            == GNUTLS_E_SUCCESS && hash_size <= SHA1_DIGEST_LEN) {
>          accept = g_base64_encode(hash, hash_size);
>      }
>      if (accept == NULL) {

Makes sense.  I'll respin.  Thanks!


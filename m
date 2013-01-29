Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U0EG0-0001am-6s
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2013 11:42:00 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U0EFx-0001Rq-A1
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2013 11:41:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U0EFo-0002gd-A2
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2013 11:41:56 -0500
Received: from mail-ea0-f175.google.com ([209.85.215.175]:36991)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U0EFk-0002eI-3s; Tue, 29 Jan 2013 11:41:44 -0500
Received: by mail-ea0-f175.google.com with SMTP id d1so281866eab.6
	for <multiple recipients>; Tue, 29 Jan 2013 08:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=vt8PXZIP8icpvhSS9zY4s9B/z5fUIenLEpSDLUNwr2s=;
	b=nAvfx5bpPbJfhoyTktly6MMmJh8KZX8exFdApL/pGyfJLrY0OemYbNRlWShY3ucpij
	rPmWdsnTfBcHu9vBQ25tKu0D2A5wrssQauAYyzN4hA8jfmiKr7jTZGDDbqAePLd25N0e
	dZvhsKl0dLTAg+1CmDRdVBHtVwvXiVR+V87U47mBmANz4rGsnW0xUBdOPEHeJfeafu1O
	rJUIeAO47l2eaBArYQjsFpf4vVm5sFCVxtf8Df8eXRrnl9LruwPAD4frvyh6h4F2h1lK
	iA37NtQDx8Oa7+JAIMALQxqSwDz9yz47st8tuu27CLnH4o3bTKk/aK7ny8r0zEOSn2ST
	rGRQ==
X-Received: by 10.14.173.69 with SMTP id u45mr4946957eel.21.1359477703205;
	Tue, 29 Jan 2013 08:41:43 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id f6sm20943187eeo.7.2013.01.29.08.41.40
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 08:41:41 -0800 (PST)
Date: Tue, 29 Jan 2013 17:41:39 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20130129164139.GA11094@stefanha-thinkpad.redhat.com>
References: <1359106276-16449-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1359106276-16449-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.175
Cc: qemu-trivial@nongnu.org, thardeck@suse.de, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] vnc: Clean up
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
X-List-Received-Date: Tue, 29 Jan 2013 16:41:59 -0000

On Fri, Jan 25, 2013 at 10:31:16AM +0100, Markus Armbruster wrote:
> Use appropriate types, drop superfluous casts, use sizeof, don't
> exploit that this particular call of gnutls_fingerprint() doesn't
> change its last argument.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  ui/vnc-ws.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan


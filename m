Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNfWb-0001Cc-MV
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 10:22:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNfWY-0001Ay-N8
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 10:22:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNfWU-0007ul-P0
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 10:22:54 -0400
Received: from mail-qt0-x233.google.com ([2607:f8b0:400d:c0d::233]:39608)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNfWU-0007ua-Kp; Tue, 29 May 2018 10:22:50 -0400
Received: by mail-qt0-x233.google.com with SMTP id f1-v6so18837593qtj.6;
	Tue, 29 May 2018 07:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VJDaPSZSaCYGL/P1QTCSsu9uEnTLPE2n/y/MJrarDUg=;
	b=kGFThCk9LsmAo84yD8LTmgR0HdoGqUr0DQWgqZ2khq7p+Bgeu0UnrZAHjthX0vKh1k
	EtUEMb08CeSLDr/sUbWwN42FH+RZto1VGjfHcRintvPtAWn8IESnbazhlAEYIw0ZQl56
	i2Gjg4bZUplcTxB0D/exYLCJce27HINOUEJ7Mwr/J/ycGYfbgQjGpTTUla8B6by42Wz7
	CDf6DdomJbf4qw/xjZEAw6npCtvGveh4mtuqcdmksKR/p9diaw2ZGR+8/21b7gkK3tVh
	oqCYMELAqOYR3sB4DSPtX+GPgNkX16oc4jdQYnNd9QiKo+BREn3BwYwWWVJDO1MZakl2
	kOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=VJDaPSZSaCYGL/P1QTCSsu9uEnTLPE2n/y/MJrarDUg=;
	b=rFzdLiufTGpejIsJV++YIaImSwEcXsIMauSlPSL1HasMj+7lS98y3IoKporc5W9MiU
	ml6Th/Hyqeyhv5De1DfdC7RAJZiaBl3LJXab0kSg+UxfqpXtdNEX+ugtXDIZw/zMpCPk
	CN9YgL3WLOeWJsa7i1HUybtocTX3QXrfOgMynjpjF1hWMbX192MMKsK50SEpwVjFaZ1H
	QseuawOgdOg7ASV0LLqDnaA0JE4XqVr16x1Uhao/Y+dR32c9roYsgq7srYy71q3dJNSW
	XrRc0aPc/RTMUyc/6WSHNKnUnF7kVF+bjRJj6LMYAQSCXXUtJMq316iwtYThcBE6dX+j
	KiVQ==
X-Gm-Message-State: ALKqPwfXtXOmsin6+g6tta7xQX25rZo8IMhMyibIPHWB2vQxhaIIblZk
	dc+L8n0Z8Ch19AO9sGGC0sGtv6E7qto=
X-Google-Smtp-Source: ADUXVKKhPnnwfUJENreLr0HSuw2miirk+ljXP8WdnF7T1fC6L3Tt/QdGJnFTb/XRzaSlQ72ECXlBmA==
X-Received: by 2002:a0c:9699:: with SMTP id
	a25-v6mr16059558qvd.119.1527603769906; 
	Tue, 29 May 2018 07:22:49 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	t184-v6sm23258537qkc.6.2018.05.29.07.22.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 07:22:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-16-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <4f76d9d2-5c4b-a6ef-e050-9d9a1f31be85@amsat.org>
Date: Tue, 29 May 2018 11:22:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20170724182751.18261-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::233
Subject: Re: [Qemu-trivial] [PATCH for 2.10 15/35] usb: correctly handle
 Zero Length Packets
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 14:22:55 -0000

On 07/24/2017 03:27 PM, Philippe Mathieu-Daudé wrote:
> USB Specification Revision 2.0, §5.5.3:
>   The Data stage of a control transfer from an endpoint to the host is complete when the endpoint does one of the following:
>   • Has transferred exactly the amount of data specified during the Setup stage
>   • Transfers a packet with a payload size less than wMaxPacketSize or transfers a zero-length packet"
> 
> hw/usb/redirect.c:802:9: warning: Declared variable-length array (VLA) has zero size
>         uint8_t buf[size];
>         ^~~~~~~~~~~ ~~~~
> 
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/usb/redirect.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> index 5e42730449..5b7073d2cd 100644
> --- a/hw/usb/redirect.c
> +++ b/hw/usb/redirect.c
> @@ -795,7 +795,7 @@ static void usbredir_handle_bulk_data(USBRedirDevice *dev, USBPacket *p,
>             usbredirparser_peer_has_cap(dev->parser,
>                                         usb_redir_cap_32bits_bulk_length));
>  
> -    if (ep & USB_DIR_IN) {
> +    if (ep & USB_DIR_IN || size == 0) {
>          usbredirparser_send_bulk_packet(dev->parser, p->id,
>                                          &bulk_packet, NULL, 0);
>      } else {
> 

Ping?


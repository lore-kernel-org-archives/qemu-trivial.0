Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVs8B-00075O-PJ
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 00:23:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs89-000756-A8
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 00:23:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs86-0002R5-6J
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 00:23:05 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:36508)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs86-0002R1-1H; Fri, 14 Jul 2017 00:23:02 -0400
Received: by mail-qt0-x241.google.com with SMTP id v31so8661038qtb.3;
	Thu, 13 Jul 2017 21:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=l8skqvh+ZV79MLcg6iFGd+Uprvlzc3Wp5HtUk6G2xis=;
	b=mwu8IFjTc+TZhp/JNwgGhAGwFX+HB2pfjk9L4MJdyWnThqxIrIbsRefyPgAN/xXKlb
	Au0W2052cuPAyyWJ/3Qd9fzAN9Jx4q6FQ0Pwo2u8AZpBg2P/JhhKU0uCulRviqXBmfVN
	nnSK44dJUdwv7hCYBacNAoGcGLXiiMidsOJC+Heo15Nyl1BsXhUqpvYbCjDqDiXrDFaV
	kN8ySkLqp01D8F2oY21WrNPj5sYtaeiAcibhHAZmSBneVPk0endksPTb/P1ardsm58sP
	sIc7iS8xqOjTLDgnWBi6l9/wA+V+NhL58bsJyptP9dO6iJ09QOe6eezmk0fG1vsFbeXT
	hHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=l8skqvh+ZV79MLcg6iFGd+Uprvlzc3Wp5HtUk6G2xis=;
	b=pyRwcz0KGb0oU5HxFkoxpAyPjjwBKhnh5zrqJOOWkAguy48/rt44oYHIgVt5SKd4xn
	sALIFGNehHF23XiUK9nbP+40E89pT0mrLruaA4TfKc7ogDwR8+fPPktdZAU4d3OINKWf
	N3WWjT4v+q1SH5KzB4oZYBL/1zIe56Ok0igAzfjnYpMDJpD0V9ct6KXWdssYILPHjY8h
	429DNZ+8E5T8Vr9z2Oftu2RPzOirBbLS+7Oc+Q9TI91uqUjNdLEnJybBnNSUAjBLpCWn
	520twBre0tZw/syCrURg4ncU/DJgF30/NdmqbZOlfrATCe9LPOEpGPRrH3GfxUpwisrH
	rsrg==
X-Gm-Message-State: AIVw113ruNBDrDxPBd6clbZtLB1pDjv8nzMGZEN7Nfwv8it3yi47A7fj
	yRFJG0rUHPkXUA==
X-Received: by 10.237.54.225 with SMTP id f88mr8967864qtb.240.1500006181500;
	Thu, 13 Jul 2017 21:23:01 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id m2sm5831922qtb.17.2017.07.13.21.22.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 21:23:00 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Amit Shah <amit@kernel.org>,
	qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-18-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <26e5fbf1-8ff7-943d-c997-1b3f1af3b8a2@amsat.org>
Date: Fri, 14 Jul 2017 01:22:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-18-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 17/29] virtio-serial: use
 DIV_ROUND_UP
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
X-List-Received-Date: Fri, 14 Jul 2017 04:23:06 -0000

On 07/13/2017 01:32 PM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/char/virtio-serial-bus.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
> index f5bc173844..17a1bb008a 100644
> --- a/hw/char/virtio-serial-bus.c
> +++ b/hw/char/virtio-serial-bus.c
> @@ -663,7 +663,7 @@ static void virtio_serial_save_device(VirtIODevice *vdev, QEMUFile *f)
>   
>       /* The ports map */
>       max_nr_ports = s->serial.max_virtserial_ports;
> -    for (i = 0; i < (max_nr_ports + 31) / 32; i++) {
> +    for (i = 0; i < DIV_ROUND_UP(max_nr_ports, 32); i++) {
>           qemu_put_be32s(f, &s->ports_map[i]);
>       }
>   
> @@ -798,7 +798,7 @@ static int virtio_serial_load_device(VirtIODevice *vdev, QEMUFile *f,
>       qemu_get_be32s(f, &tmp);
>   
>       max_nr_ports = s->serial.max_virtserial_ports;
> -    for (i = 0; i < (max_nr_ports + 31) / 32; i++) {
> +    for (i = 0; i < DIV_ROUND_UP(max_nr_ports, 32); i++) {
>           qemu_get_be32s(f, &ports_map);
>   
>           if (ports_map != s->ports_map[i]) {
> @@ -863,7 +863,7 @@ static uint32_t find_free_port_id(VirtIOSerial *vser)
>       unsigned int i, max_nr_ports;
>   
>       max_nr_ports = vser->serial.max_virtserial_ports;
> -    for (i = 0; i < (max_nr_ports + 31) / 32; i++) {
> +    for (i = 0; i < DIV_ROUND_UP(max_nr_ports, 32); i++) {
>           uint32_t map, zeroes;
>   
>           map = vser->ports_map[i];
> @@ -1075,7 +1075,7 @@ static void virtio_serial_device_realize(DeviceState *dev, Error **errp)
>           vser->ovqs[i] = virtio_add_queue(vdev, 128, handle_output);
>       }
>   
> -    vser->ports_map = g_malloc0(((vser->serial.max_virtserial_ports + 31) / 32)
> +    vser->ports_map = g_malloc0((DIV_ROUND_UP(vser->serial.max_virtserial_ports, 32))
>           * sizeof(vser->ports_map[0]));

This line seems quite long now

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>       /*
>        * Reserve location 0 for a console port for backward compat
> 


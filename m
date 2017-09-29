Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dy7Ur-0005mb-7V
	for mharc-qemu-trivial@gnu.org; Fri, 29 Sep 2017 22:27:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52318)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy7Uo-0005lv-28
	for qemu-trivial@nongnu.org; Fri, 29 Sep 2017 22:27:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy7Ul-0007RI-Rk
	for qemu-trivial@nongnu.org; Fri, 29 Sep 2017 22:27:14 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:36207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy7Ul-0007Qv-Mt; Fri, 29 Sep 2017 22:27:11 -0400
Received: by mail-oi0-x243.google.com with SMTP id a74so579014oib.3;
	Fri, 29 Sep 2017 19:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Awv6USRNzWh53rtS2fJ8dytHsJuDxK14aqF0PTHIm9A=;
	b=oXUuLcntpyxl8Sk6azVMUuXLLlpaNLZuCXO8oYWBFOdGpeZFUqO6HAXVoyFeSJryQQ
	B8svJRYoEkguqcnIGQJHfGDWBJbwOpbNo43t0NctmIHaDKoroxJIVvdeeEK26pdmI7WL
	RXMMe7tGU9MICqFde6FAoa4oBts9Xrv9hpRpVItaCV6vdtugmtpsEAmImD+RVUZotL6J
	gcgO4mVCJn9geL7gTLh86g27xQq00iVmfzjnXWLY9ASyn8lcmWeuDKyRegdYRErbQfwj
	J+ldPdZMAUPFCBxxkLODvKVdTvitiOZnDAwOCM2cXA2dhoffZMtbLRPCQN3c+nggQ3kK
	vbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Awv6USRNzWh53rtS2fJ8dytHsJuDxK14aqF0PTHIm9A=;
	b=kUT+qSEq8UgZLMuy4/xzKng4mwB9ZdlLedxgt/UQtcNXGdZt3Flinv0pdVYsM53Hzh
	BQBjYQ3sIieuLQ3Uo3Pd3mU0ndafFmHvr/c+hHv17M2di2CuuTQ326O24BFSEcjNFZ8m
	w1kuPXrTHcNWzKbD9z7MNiw5kk69DyNBC9Gda/UncrVDDny+XQ8J1dWHuDX/Hrmju2CD
	vaIC0YvZ+4hX3qP+BFD9EUINSKOiR0g6hUE8UlhY/VtsvQvohCha9BtDq+iOU9n5KMyL
	HuUbMsbGzgmv/I8mbWnibsmBt54OKluvQwWdOdbFjXAR9G3d0c3zrodabaac6mDlUSDJ
	Hdjg==
X-Gm-Message-State: AMCzsaVJqmmTeqqKl1v8E8r4BuwJmqJWxugNoLLPa+C4u1Pn6wdXV9/v
	tmZhGpNzEgxrQHUGv4AU6vM=
X-Google-Smtp-Source: AOwi7QDECxu5xC5SsH9s/42ywG9l+6gO4IROjw0fbr75g3cpo8qtVft5h6zEAAX/XB7vPL8Bx3vBnw==
X-Received: by 10.157.54.173 with SMTP id h42mr4049599otc.83.1506738431157;
	Fri, 29 Sep 2017 19:27:11 -0700 (PDT)
Received: from [192.168.109.31] ([64.125.109.186])
	by smtp.gmail.com with ESMTPSA id
	e38sm2633027oth.80.2017.09.29.19.27.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Sep 2017 19:27:10 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Carlo_Marcelo_Arenas_Bel=c3=b3n?= <carenas@gmail.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
References: <20170926202512.37670-1-carenas@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cdfde400-e8d7-4733-a872-b6f83c0b7183@amsat.org>
Date: Fri, 29 Sep 2017 20:45:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170926202512.37670-1-carenas@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gitignore: ignore
 check-qlit test
X-BeenThere: qemu-trivial@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@gnu.org>
List-Help: <mailto:qemu-trivial-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Sep 2017 02:27:16 -0000

On 09/26/2017 05:25 PM, Carlo Marcelo Arenas Belón wrote:
> Signed-off-by: Carlo Marcelo Arenas Belón <carenas@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   tests/.gitignore | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/.gitignore b/tests/.gitignore
> index cf6d99c91e..53cb2efaee 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -6,6 +6,7 @@ check-qdict
>   check-qnum
>   check-qjson
>   check-qlist
> +check-qlit
>   check-qnull
>   check-qstring
>   check-qom-interface
> 


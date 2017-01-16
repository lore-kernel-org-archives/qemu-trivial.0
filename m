Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cT6NG-0002RQ-J8
	for mharc-qemu-trivial@gnu.org; Mon, 16 Jan 2017 07:26:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cT6ND-0002Pz-Nf
	for qemu-trivial@nongnu.org; Mon, 16 Jan 2017 07:26:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cT6N8-0003sh-V5
	for qemu-trivial@nongnu.org; Mon, 16 Jan 2017 07:26:55 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35160)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1cT6N8-0003s8-MR; Mon, 16 Jan 2017 07:26:50 -0500
Received: by mail-lf0-x241.google.com with SMTP id v186so12408262lfa.2;
	Mon, 16 Jan 2017 04:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=pmJM5IQEr+q3fkI6GoXuocnGqsbu4AHGtowkqyZt4m0=;
	b=eprLEEcUrqF0Ce0nZlN6fQ4esnsA11L1gf7sIy2fik2kOi4ws216ddpZDOkQxhkhXn
	JypsnEjGZAtbnIaFbFVzSXd006IB2gr9gEJinEIk43Qkp0f8+/AqdBB1ORLF6e00AYhC
	biZ+ebTn7P6Sik82fGhgehAU67o+6c3cDY0ETyJh7K/uQyWB95VbTrc8Vvmod0nnvRYY
	NlX+kYTDcRfyeEYkGT6Kj6d4fKUazb4TlHJTyBauniNeyzGuR3huBCcKc9R/rBmSTiqx
	5YHp1XorIjHkiPHUSXoZrLw2CVvdpOYedF8lTB2X75NVfDruIwHM6X5BdOfAoa+0v1cK
	LI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=pmJM5IQEr+q3fkI6GoXuocnGqsbu4AHGtowkqyZt4m0=;
	b=tQ/RcI0gSn3BI+TAmzZdXj6WfY1d7StFO48xVbiX7Yha+F5kLTRT99zAkiVBmewywj
	Zc7c0TDgzLnnaj/CAlyymrd6uaB89oUkHOvZMyf50xeuOtToH0sDsa39L49SxgStC3g8
	Df2kdGbI9GF+Qdvv7xzgYLnem56dLiXd8Pa0mLeivZfF6uwmyeFzJacruG81sIkbH/mq
	UH+Rr/mMP+YBbTmk2ieV4Q5swvoLBoVSy6Aj96tBRz0145COjeN2xRNPp7L1Y9N9Dpfv
	8EzvuLbJu1Bt7i5F/E831Pq/1a5rx2c7wJ4b6cOi6iekuwNvbOCambUqslBjSNWwl6K9
	OI2w==
X-Gm-Message-State: AIkVDXKymyRYqLixrePb+wvuzYbrIRLeGOHq+JYFqUdkIqfdXgc2C+4x9xQDFw78UH33UA==
X-Received: by 10.25.158.147 with SMTP id h141mr4533363lfe.160.1484569609364; 
	Mon, 16 Jan 2017 04:26:49 -0800 (PST)
Received: from [192.168.10.165] (94-39-158-71.adsl-ull.clienti.tiscali.it.
	[94.39.158.71]) by smtp.googlemail.com with ESMTPSA id
	u12sm7132056lja.19.2017.01.16.04.26.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 04:26:48 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Samuel Thibault <samuel.thibault@gnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Jason Wang <jasowang@redhat.com>
References: <20170115203014.GA12068@var.home>
Cc: qemu-devel@nongnu.org, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <54d064db-076e-b3cc-f151-3c4e74163121@redhat.com>
Date: Mon, 16 Jan 2017 13:26:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170115203014.GA12068@var.home>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-trivial] [PATCH] Drop duplicate display option
 documentation
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
X-List-Received-Date: Mon, 16 Jan 2017 12:26:57 -0000

Cc: qemu-trivial@nongnu.org

On 15/01/2017 21:30, Samuel Thibault wrote:
> The curses and none possibilities are already documented on a separate line,
> so documenting it on the sdl line was both unneeded and confusing.
> 
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index c534a2f7f9..9c81d3752d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -927,7 +927,7 @@ ETEXI
>  
>  DEF("display", HAS_ARG, QEMU_OPTION_display,
>      "-display sdl[,frame=on|off][,alt_grab=on|off][,ctrl_grab=on|off]\n"
> -    "            [,window_close=on|off][,gl=on|off]|curses|none|\n"
> +    "            [,window_close=on|off][,gl=on|off]\n"
>      "-display gtk[,grab_on_hover=on|off][,gl=on|off]|\n"
>      "-display vnc=<display>[,<optargs>]\n"
>      "-display curses\n"
> 
> 


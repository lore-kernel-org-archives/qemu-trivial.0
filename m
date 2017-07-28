Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dayuZ-0007yV-9G
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 02:38:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1dayuX-0007xR-Cl
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 02:38:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1dayuW-0007ge-Hz
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 02:38:09 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:36390)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shorne@gmail.com>)
	id 1dayuS-0007ap-Ff; Fri, 28 Jul 2017 02:38:04 -0400
Received: by mail-pg0-x243.google.com with SMTP id y129so22743826pgy.3;
	Thu, 27 Jul 2017 23:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=1xiQLmcf+Xn8mkCs28Wl68SRQgExuLTBYF7wZLk+nmc=;
	b=RV121xVSKZ3w0X99NfA1dUIjXPYot9/L7W+BZnwS87eZa1j9TV04s0hHIJ9WT+GfPp
	RPBhGVm82DONyYKpfR5Ds8GvsNFUUx8ftEhVZGeaWD6cFkJXl5ClPySHiKBY9a/0OqoD
	Dnel1LtckABytTTVTeKdBR7GM9k0tC1R0sUmTXCsPDNWo21rMMLOKfH2xzkLCZp5esFa
	gYGzl0chz3Y4btFsierENS4JrdeCybXmEq2MQWPkuOnXh20aGAO561KNeDL07yX+epzU
	Om4rOZrhxkMWQBCFH4l2sh0zcZQktr0UcQCpO+XzJqCEhBSkYFIGN4fS43A/boaARk9a
	dorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=1xiQLmcf+Xn8mkCs28Wl68SRQgExuLTBYF7wZLk+nmc=;
	b=sYTer6IMELh3MaNVqQ0qJWSb/1Fap9sFLFafv0vSklOu3lcfoSKQpXDhTPmESLEF8a
	lbf896aUR7pUIQbaeMYGcg9kXCrzM1I+H0k69kl3g3K6XG8kIhkoYAFCPZySvlXuPxRA
	3dm8wgPekQuSPbXp/s17RSJoFyOjNSd3lHegnox11mTP7XN1RT8BjZElyc/U9F2M+2t9
	HPnc1/YqNkpXvnNvYqB7BOCkUFlg9coC8ISfN3jJw0ZwRjbNPiyiEdgeCJcT7N92gxB1
	JgLo+o7zlUt/GNxyncVZ5XyZ2suGb69Ij8v8qU0Oynmc93a5Hvyq6yfempCfK2DG/eRj
	yNfg==
X-Gm-Message-State: AIVw11231VtmLv30hTJOLkUsG+CK7L56CsrSH+ti85Bf7OQqQ5ndSxU/
	kBRCfnr8K+0PYuSncAQ=
X-Received: by 10.101.70.15 with SMTP id v15mr6511674pgq.229.1501223881863;
	Thu, 27 Jul 2017 23:38:01 -0700 (PDT)
Received: from localhost (g76.222-224-177.ppp.wakwak.ne.jp. [222.224.177.76])
	by smtp.gmail.com with ESMTPSA id
	k4sm27824500pgr.74.2017.07.27.23.38.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 27 Jul 2017 23:38:00 -0700 (PDT)
Date: Fri, 28 Jul 2017 15:37:58 +0900
From: Stafford Horne <shorne@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170728063758.GA3031@lianli.shorne-pla.net>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-28-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170728053610.15770-28-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: Re: [Qemu-trivial] [PATCH 27/47] MAINTAINERS: add missing OpenRISC
 entry
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
X-List-Received-Date: Fri, 28 Jul 2017 06:38:10 -0000

On Fri, Jul 28, 2017 at 02:35:50AM -0300, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a4df19d304..35a7253e22 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -207,6 +207,7 @@ S: Odd Fixes
>  F: target/openrisc/
>  F: hw/openrisc/
>  F: tests/tcg/openrisc/
> +F: default-configs/or1k-softmmu.mak

This looks fine,

Acked-by: Stafford Horne <shorne@gmail.com>

>  PowerPC
>  M: David Gibson <david@gibson.dropbear.id.au>
> -- 
> 2.13.3
> 


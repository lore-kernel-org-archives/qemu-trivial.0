Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qnHlD-000442-IY
	for mharc-qemu-trivial@gnu.org; Mon, 02 Oct 2023 08:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qnHkv-00042o-Bx; Mon, 02 Oct 2023 08:10:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qnHki-0005D4-R6; Mon, 02 Oct 2023 08:10:33 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 8751D26BF0;
 Mon,  2 Oct 2023 15:11:00 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 9C6322C292;
 Mon,  2 Oct 2023 15:10:17 +0300 (MSK)
Message-ID: <24df29be-eb3f-0783-335c-3a77cc957d57@tls.msk.ru>
Date: Mon, 2 Oct 2023 15:10:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1] roms: use PYTHON to invoke python
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>, qemu-devel@nongnu.org
References: <20231002101844.13799-1-olaf@aepfle.de>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20231002101844.13799-1-olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.321,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Oct 2023 12:10:39 -0000

02.10.2023 13:18, Olaf Hering:
> python3 may not be the expected python version.
> Use PYTHON to invoke python.

Applied to my trivial-patches tree, thanks!

/mjt

> Fixes: 22e11539e1 ("edk2: replace build scripts")
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> 
> diff --git a/roms/Makefile b/roms/Makefile
>   
>   efi:
> -	python3 edk2-build.py --config edk2-build.config \
> +	$(PYTHON) edk2-build.py --config edk2-build.config \
>   		--version-override "edk2-stable202302-for-qemu" \
>   		--release-date "03/01/2023"




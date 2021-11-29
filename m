Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mri1w-00022A-I4
	for mharc-qemu-trivial@gnu.org; Mon, 29 Nov 2021 09:53:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmiller@gmail.com>)
 id 1mrhsV-0006JW-Ed; Mon, 29 Nov 2021 09:43:36 -0500
Received: from [2607:f8b0:4864:20::733] (port=45833
 helo=mail-qk1-x733.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <emmiller@gmail.com>)
 id 1mrhsT-00049o-Cb; Mon, 29 Nov 2021 09:43:35 -0500
Received: by mail-qk1-x733.google.com with SMTP id d2so23013070qki.12;
 Mon, 29 Nov 2021 06:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=aUhP4CMYU7dVL2qjpeM3AeiARp715daq6Z8ooc19IVg=;
 b=qJp5k9kV6j6qHZSgzlP+z7AsiPn09OgTaj6FNi2K0Hsvp/sGgEbfeDtu1CCk0qORlA
 XZtEtuNRY6QaLwjlHHfXafVB3DEWK49k1Y6h2lrgvNyK75uUTg8hWQNF8BYXdw0rThQ/
 n415ZwS68C9M5IJYvRDPaLcbenbGy0HwvdMmTEJmqO2AnWqvdSNQWVQVpwDkrBRGCsgW
 YnrMDmfgsDAjmJMYKNjQpPcQ9UWHpfi4obEeu4pA5Tc8erU800wOpvFrznWTUeLawk1L
 KsW2ndA/cksDmH9d/8pZve8fNLvwRzp5bHCz15z4ajNMXnKllFs0MfNdP3TcqNaALuCu
 ytng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=aUhP4CMYU7dVL2qjpeM3AeiARp715daq6Z8ooc19IVg=;
 b=34hrjVIacCTMfoNxACZqNVBNbGJxMISqdafaJLZHF6vqhGxzxj+PcvOOx3+SfNTvhc
 qLVfKKePNM+/4PkgFdwBvfc3vm9hoM8+w/JEEu0c6yAfFiPd4kDDx5t7clouisJhGxMC
 Du41hROqa2NU2cjpBCeTYNACdNs/vcj1/CoYNaoTXXTZplOzGANfHxy/cNKSYpPkjXdO
 ULBghvWnQrry4zkKAB/5WCcJnU2srdXfltCayujAnzDCPuEXcGD9HJEbbo2ySunuKVlj
 Sy6bGvkSYAC6vzj6gH3VmOqFCCCNVL5YL0/TADzAxw8HvDIwau/ggKCrXb9cXlYVf6uT
 0ejQ==
X-Gm-Message-State: AOAM533kEsukOk0asQUm+IgGy/GJM8skFrMgxqXOGU0S/m6I4hjzcKxy
 Z4Dp6ZtaSoM5ygiPa1MPiLswDs2NY5c=
X-Google-Smtp-Source: ABdhPJwTvjCYw86mxXpTCqVhZi6Z7BnYRmcp8pII8a6AEl/a7vhaBOOmHLIvFGqDC0O8IDm6QFa2sg==
X-Received: by 2002:a37:ccc:: with SMTP id 195mr38881446qkm.371.1638197011076; 
 Mon, 29 Nov 2021 06:43:31 -0800 (PST)
Received: from smtpclient.apple (host-66-85-236-20.MIDOLT3.epbfi.com.
 [66.85.236.20])
 by smtp.gmail.com with ESMTPSA id i14sm8266589qko.9.2021.11.29.06.43.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Nov 2021 06:43:30 -0800 (PST)
From: Evan Miller <emmiller@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: [PATCH] block/file-posix.c: Fix compilation on macOS SDKs <10.12.4
Message-Id: <B80D2309-1C4D-4410-B182-C704EA9D9386@gmail.com>
Date: Mon, 29 Nov 2021 09:43:30 -0500
Cc: qemu-trivial@nongnu.org
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::733
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=emmiller@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 29 Nov 2021 09:53:18 -0500
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
X-List-Received-Date: Mon, 29 Nov 2021 14:43:36 -0000

fpunchhole_t was introduced in the macOS 10.12.4 SDK. For reference, =
see:

https://developer.apple.com/documentation/kernel/fpunchhole_t

Test the SDK version before attempting any fpunchhole_t-related logic.


Signed-off-by: Evan Miller <emmiller@gmail.com>

--- block/file-posix.c.orig
+++ block/file-posix.c
@@ -1830,7 +1830,9 @@
         ret =3D do_fallocate(s->fd, FALLOC_FL_PUNCH_HOLE | =
FALLOC_FL_KEEP_SIZE,
                            aiocb->aio_offset, aiocb->aio_nbytes);
         ret =3D translate_err(-errno);
-#elif defined(__APPLE__) && (__MACH__)
+#elif defined(__APPLE__) && (__MACH__) && \
+      defined(__MAC_OS_X_VERSION_MAX_ALLOWED) && \
+      __MAC_OS_X_VERSION_MAX_ALLOWED >=3D 101204
         fpunchhole_t fpunchhole;
         fpunchhole.fp_flags =3D 0;
         fpunchhole.reserved =3D 0;=


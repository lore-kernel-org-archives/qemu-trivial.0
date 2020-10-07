Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQExd-0006B1-0h
	for mharc-qemu-trivial@gnu.org; Wed, 07 Oct 2020 15:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQExb-00068L-Jv
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 15:18:47 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:45976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQExZ-0006ZH-Hx
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 15:18:46 -0400
Received: by mail-ed1-x544.google.com with SMTP id dg9so1007925edb.12
 for <qemu-trivial@nongnu.org>; Wed, 07 Oct 2020 12:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G27J4QAupmWFVg/mYbLXYrM++wzdzHh71grXpDOYGfM=;
 b=Kq6S9jJby9nPMAA3OXwAySDoXaVUd5PXYWn/WZ8g4Qk0xEuE9YSoaZ+0iY1WqOZpnr
 OYXAwb8o0BlZ8NB9tUMa2KVG+ALcoPZpEnv+d8hGPPcog3hvarvL2Wd2c/1SFmHJU8rD
 nyvmPQaWP14E7vKue7pPvvXQaiwGDFuq+jQtu36TwZOYOEhu8zondZysKdh+VHTiD9K3
 h6JJQMatcQ5QwTNOs7NI0wSexDVY+lDvOoSm09QZEM+ze/Fn4LW6z4tk156c01bmDpre
 YS5mxHb8bWg/gcYoyBXHeTUL0KqVlzC7ujF/X9ltadiZ+MtBH0T7SrCc32tzqjNrTp2b
 DGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G27J4QAupmWFVg/mYbLXYrM++wzdzHh71grXpDOYGfM=;
 b=QbH9Hz0T1kYHK4WtNza//+f+a14/UAxMBOiG6bl8cdSeWiFqG0DppRj9PbPrdMSk7v
 OZWhX4sHVQNAwfUN+flVsCAnsP4Z8TQMUjRHd5PU6fluiGcgr+nDmEjTYukRJuRcMYFk
 Cq4AI6a1hl338aEPDEmUdHI25hka3+5XCRQD2jYFi5gwDrAyPEDprDrogeCc0iNka6Gc
 PV2qfcIxCyQez+9ISgzYeWSbvu40Xjh7vAjjwqADcMAfyFCt+D4aZy8d3G1Z3Fw8E9w1
 8uIygynjQm2QlcQcH0zDKk4g5y/Kd0WGZU65MoxfLp1G27JQxbOrEvofMrlGeFNiqCfu
 saEg==
X-Gm-Message-State: AOAM532pVmZdJcaBjKQBZ5/spT3B74lH8eOQcgmnw2s/FPATmlmCy+oE
 0TDet4gT8WftEf/A4mii6j/vQ6UgDSQtQeNBZFOgLA==
X-Google-Smtp-Source: ABdhPJy24X1Lq5fgnKn4fD6WJzpudtao5xbfZ6NjByGCdeW75ZkuW08ueEr8cGaLOncVF0JzqS9rKAJtvVV6igxTds0=
X-Received: by 2002:a50:9ea6:: with SMTP id a35mr5479604edf.52.1602098322538; 
 Wed, 07 Oct 2020 12:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201007162138.425-1-luoyonggang@gmail.com>
 <CAE2XoE9sf0p5QuG=dSqbOvmGvbzDaEBN8qSG1ejM=RH+D+zq1g@mail.gmail.com>
 <798fb17d-fcf5-3234-1e17-37b3c0a18b8e@redhat.com>
In-Reply-To: <798fb17d-fcf5-3234-1e17-37b3c0a18b8e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Oct 2020 20:18:31 +0100
Message-ID: <CAFEAcA8ivKMgGCjQSB1jmVjYDt4oMDfj+L1-coqVpEJnhEfwpQ@mail.gmail.com>
Subject: Re: [PATCH v6] scripts: Convert qemu-version.sh to qemu-version.py
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Yonggang Luo <luoyonggang@gmail.com>, qemu-level <qemu-devel@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Oct 2020 19:18:47 -0000

On Wed, 7 Oct 2020 at 17:43, Paolo Bonzini <pbonzini@redhat.com> wrote:
> I have no idea how to fix it.  Probably it can be made to work using a
> string argument and "shell=True", but at this point it makes more sense
> to keep the shell script version.

If you're keeping the shell script version could you queue
the bugfix patch to it?

https://patchew.org/QEMU/20200929143654.518157-1-marcandre.lureau@redhat.com/

thanks
-- PMM


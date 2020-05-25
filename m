Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jd3R7-0008Fg-9V
	for mharc-qemu-trivial@gnu.org; Sun, 24 May 2020 23:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1jd3R6-0008FG-90
 for qemu-trivial@nongnu.org; Sun, 24 May 2020 23:05:56 -0400
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43]:40156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1jd3R5-0000o0-8s
 for qemu-trivial@nongnu.org; Sun, 24 May 2020 23:05:55 -0400
Received: by mail-qv1-xf43.google.com with SMTP id l3so7520498qvo.7
 for <qemu-trivial@nongnu.org>; Sun, 24 May 2020 20:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=JUw6SA+aFNJL0DhGpFZToE7ce5zu8tNK/aXrR0hv2cI=;
 b=MbZscF39G5D3hLk3ESYZ8wmiThFp4/+QXu8fYNxIUl/eIN/dD00f0WQZEPyDn9qyR+
 8JueNueg7UnrD8wVmpskxnrgKsFGChAsUYj421DJ/qTriE+BS+arX/LAbPQ2HMbnRMpw
 feegx4USbeqeW7GdXDKfAvezZkT05z2buShDGPR6uMY8URhUCrsDUqWh1ehug7wfpVKo
 3OKS34v3aGSCBQvWxz/4me0dvh0z1ZDAeauK98OuvHoiHACkDifte8J3wo3MGt+/CkD3
 m8+Oi9HvyswZesPAY8CuUIMt9L5mnhXY0AvKWeXEccSs8IRyxcXC/xYf+nJNd0oY6phP
 k1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JUw6SA+aFNJL0DhGpFZToE7ce5zu8tNK/aXrR0hv2cI=;
 b=k4rBW3GnaKr4R8JxAxJwFR19BJbrjMcxfH77QmuXVBI/rw3igVj7y3RqgjHm7elvib
 9B+sw7weYvNAj3rrTklCjAkBaQQixIB/w/XTfL4O/vAefQOx1CkyZPvB87fV9rxxlT39
 OxLoMAGwI8kHKnbd4oFlxBG8LSHpqzB+5uaew9ya2iPHCGUG2gNNR9eGkPznc4xqqJXy
 1F7E1c1/RWFGI7o+bLPkdDMonUdCcl1fT6WYhKCdFUGYLWGt1tmekOBFa9/jsSz8fHWN
 P/mFyS86BAnWRNLUovEkYV7betQQdAy/VeEmztVZVxIBTnk5tlXkCj9tMTb0C3yOT5vR
 NHJA==
X-Gm-Message-State: AOAM531iPdubKzVdN69I+9RO47Rgp/4IyYavTYiHpY4LYLSBeO4P9eRW
 aYwrcCxv75EceXrD08G8D6fjOg==
X-Google-Smtp-Source: ABdhPJwQI409Ly1PwqwjTotVB6dTVDuVh88Oxv9+L1YFdyDGS6zX+m7xQhkHTlTaZpfGmwn8YLLAPg==
X-Received: by 2002:a0c:8e84:: with SMTP id x4mr14069567qvb.175.1590375954151; 
 Sun, 24 May 2020 20:05:54 -0700 (PDT)
Received: from localhost ([70.19.54.161])
 by smtp.gmail.com with ESMTPSA id v1sm10520417qkb.19.2020.05.24.20.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 20:05:53 -0700 (PDT)
Date: Sun, 24 May 2020 23:05:52 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] scripts/clean-includes: Mark 'qemu/qemu-plugin.h' as
 special header
Message-ID: <20200525030552.GA990262@sff>
References: <20200524215654.13256-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200524215654.13256-1-f4bug@amsat.org>
Received-SPF: softfail client-ip=2607:f8b0:4864:20::f43;
 envelope-from=cota@braap.org; helo=mail-qv1-xf43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_SOFTFAIL=0.665,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 25 May 2020 03:05:56 -0000

On Sun, May 24, 2020 at 23:56:54 +0200, Philippe Mathieu-Daudé wrote:
> "qemu/qemu-plugin.h" isn't meant to be include by QEMU codebase,
> but by 3rd party plugins that QEMU can use. These plugins can be
> built out of QEMU and don't include "qemu/osdep.h".
> Mark "qemu/qemu-plugin.h" as a special header that doesn't need
> to be cleaned for "qemu/osdep.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Emilio G. Cota <cota@braap.org>

Thanks,
		Emilio


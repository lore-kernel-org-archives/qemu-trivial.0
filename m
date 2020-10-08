Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQYbv-000051-I3
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2020 12:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.turek@gmail.com>)
 id 1kQWfB-0007JQ-88
 for qemu-trivial@nongnu.org; Thu, 08 Oct 2020 10:12:57 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brian.turek@gmail.com>)
 id 1kQWf9-00045H-NP
 for qemu-trivial@nongnu.org; Thu, 08 Oct 2020 10:12:56 -0400
Received: by mail-wr1-x441.google.com with SMTP id n18so6800394wrs.5
 for <qemu-trivial@nongnu.org>; Thu, 08 Oct 2020 07:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q+j0N7+lcRbcy4viEnbMSffRArsHBH0jHtcsvfNeSzs=;
 b=XgqpPGPiV7Ox/UOrBrc7DGiKdo7ryKJvvYdUazYhzJTkho5GglTkeeHHnJ+Ltr5PUg
 2K2ikJRZQJxVyZPkEVa8F2d9CLdHD4lnRovY8/6firgyI/NscN5RS/06mo0rwcTCZaFV
 KbCsLJGLx61Jnry6f0IkGOZf7d9vXXc3Tf0juPJMSQzrH4Q3yUPJ8rx02OU8I37QMlVH
 A9HjE27kQchCsFFMlZ2C1yOvhjieKWRel1cUZJ621fWCjJBb56JT2yjLui6dXpCvkk+h
 qM9z6kbvX16Lzxm1Gdsvomk4Q+WjIRU66O+/JVYRm3JxSe86vDN8y9Ve3aD2wX30ecDh
 0feQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q+j0N7+lcRbcy4viEnbMSffRArsHBH0jHtcsvfNeSzs=;
 b=CCYnGHQ7ySxwtRNdJ2Dc1uYWkVIzcQUsaVkpKFvsOl7XrtL803KLTpEBuKenWRE52a
 GON59FQaoj+PeuxIX8pdhY1hSh+4XPvd5U8S0tCK5UvvX3TKIoHEU6y7//8hQHYDL1kB
 RhoEEn3qBIlI7CquU3BWrVPPU9JwG09pLSWVVlyJJeZsY852emH5nZ4ptMBB6tdxqmfD
 21caZ10Lvd/o2n9ERBw14r3FGOhk0fQ5bVHMnS1n85eUEbV6RiJhp/PZ4ogHzspdGFrI
 88/VT9uU+PcYF4p3MrrlYL/cVR2pKBvJ9RGvG5Z3r/JLSjenU7OhNbpShocpItHG6XiX
 3NMw==
X-Gm-Message-State: AOAM532hRfJb97srqWwaVuwfXRJYev6cbaf2IWZ+2ZHaDbAIHMMUJe8o
 p0R8OyrlrgzNIep1IBQaIBu4p4DtOrdyHA==
X-Google-Smtp-Source: ABdhPJzUNIZVrW5ITEWJ+lRs8ucNLVVCOWg6DFMLkTRkyrkwGZd0o++xP1U7g5CpBS3dvVTWKYb+7Q==
X-Received: by 2002:a5d:51ca:: with SMTP id n10mr9562707wrv.222.1602166373027; 
 Thu, 08 Oct 2020 07:12:53 -0700 (PDT)
Received: from localhost.localdomain
 (cpc75556-harg6-2-0-cust35.7-1.cable.virginm.net. [86.3.36.36])
 by smtp.gmail.com with ESMTPSA id a199sm7565353wmd.8.2020.10.08.07.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 07:12:51 -0700 (PDT)
From: Brian Turek <brian.turek@gmail.com>
To: qemu-trivial@nongnu.org
Cc: Brian Turek <brian.turek@gmail.com>
Subject: [PATCH 0/1] docs: Clarify formatting for 'fmode' and 'dmode'
Date: Thu,  8 Oct 2020 15:12:30 +0100
Message-Id: <20201008141231.5738-1-brian.turek@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=brian.turek@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 08 Oct 2020 12:17:42 -0400
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
X-List-Received-Date: Thu, 08 Oct 2020 14:12:57 -0000

I sent the below patch to the dev mailing list on 6 Oct but then later
discovered the trivial patch process. Hopefully it's OK that I'm
mailing this separately as opposed to a CC on the original email.

The current documentation for the 'fmode' and 'dmode' options for
fsdev/virtfs is ambiguous for the expected format of the values.  The
code itself parses the value using a call to strtoull with base=0 which
causes values like "644" and "755" to be parsed as base-10 rather than
base-8. This can cause unexpected behavior.

This patch changes the docmentation to be explicit on the expected
format and mentions the fact that the setuid, setgid, and sticky bit are
dropped.

Brian Turek (1):
  docs: Clarify formatting for 'fmode' and 'dmode'

 qemu-options.hx | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.25.1



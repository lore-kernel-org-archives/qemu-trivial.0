Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqnC0-0003u6-LZ
	for mharc-qemu-trivial@gnu.org; Wed, 22 Mar 2017 16:49:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cqnBy-0003sp-Fe
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 16:49:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cqnBx-0000Sh-QS
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 16:49:14 -0400
Received: from mail-qk0-x229.google.com ([2607:f8b0:400d:c09::229]:35754)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cqnBt-0000SG-JX; Wed, 22 Mar 2017 16:49:09 -0400
Received: by mail-qk0-x229.google.com with SMTP id v127so165734289qkb.2;
	Wed, 22 Mar 2017 13:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dslsXRwKc2bFy/mFe4G2MPjMZ/+deFijyvYOIFx45yE=;
	b=uS0FUz3Yb6Kv33goeAfwBLMc63Qm/NakzlLB6Ha3SN+jB7kSh80GI2qV2oNRFklaG3
	ngeBw4HNC0UH/6Z/5k6t554v1qbKcdlDjgw5DbOuktZzfwCuaIVe3RSa7WtgYLLyzhIq
	Ausl7UpfiRC/tvwL+dNHxL6XcMx+rH3+HDQyOKaIWxYzB1C/t91k1yWqvOD/8Bq/c9Ob
	aN5qa58LdqmRY2acxTMs+DzuhLcYLKCfI0+rPRYdWnF2IoMR5fguRE6KOJBJZC+Cdlv6
	fJCSkRggDIVxFPPqeENtZMp+9EyBl/UoxNusKgoI2v4OUGRFZnbFB0xpHnFCcLHRzYaw
	w2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=dslsXRwKc2bFy/mFe4G2MPjMZ/+deFijyvYOIFx45yE=;
	b=QXyISIQrWpdNVclZ6FFvlyfk9WMSJwARziv6zUAe9zlfU+G1hgUBEqL4Mo1K1+l0h8
	NbYWpLZqQKl4JN0SRV+7dwRkO/YC9iJOlhkLJFmF8ieJtP/OhHH9wt8thmE4pC9r8MR5
	wuFqT0aU1B3VJmUCzlo+oAILk9W335u9mcCpE5s90hvKsq7SBD16QZEVVz58SrMRI+YD
	QsEyN8R9M5PzuCFEMJ4wMCNFzlIHHRB5KSlI1mWa7xXfC7qUionu18E6+Jck5eY/ijdK
	/9rvsoRdGwBT9DtAT++Obm2oH3aqumRwN5sI0LmMJzkOaR/dOU9g6dK0Gov0cUe2XVJf
	baKw==
X-Gm-Message-State: AFeK/H3w6G8lKEOdRwRkmkg+XTbb3Mh/sLrxIc701LsUgiaCd9sT01ADRSfyqQhyDil6zQ==
X-Received: by 10.55.74.149 with SMTP id x143mr39580495qka.6.1490215748994;
	Wed, 22 Mar 2017 13:49:08 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	u43sm1767263qtc.11.2017.03.22.13.49.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 13:49:08 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Roth <mdroth@linux.vnet.ibm.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 22 Mar 2017 17:48:41 -0300
Message-Id: <20170322204844.446-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::229
Subject: [Qemu-trivial] [PATCH RESEND 0/3] easy-to-fix clang warnings
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
X-List-Received-Date: Wed, 22 Mar 2017 20:49:15 -0000

This patchset fixes three easy-to-fix clang warnings.

Resent adding Marc-André Lureau's Reviewed-by and CC'ing qemu-trivial as
suggested by Markus Armbruster.

Philippe Mathieu-Daudé (3):
  usb-ccid: make ccid_write_data_block() cope with null buffers
  device_tree: fix compiler warnings (clang 5)
  qga: fix compiler warnings (clang 5)

 device_tree.c                 | 1 +
 hw/usb/dev-smartcard-reader.c | 8 +++++++-
 qga/commands-posix.c          | 8 +++++---
 3 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.11.0



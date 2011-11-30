Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RVjoM-0005Ud-He
	for mharc-qemu-trivial@gnu.org; Wed, 30 Nov 2011 08:02:54 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RVjoJ-0005UR-Cr
	for qemu-trivial@nongnu.org; Wed, 30 Nov 2011 08:02:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RVjoD-00070n-F9
	for qemu-trivial@nongnu.org; Wed, 30 Nov 2011 08:02:51 -0500
Received: from smtp.eu.citrix.com ([62.200.22.115]:34267)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RVjoD-00070W-Aq; Wed, 30 Nov 2011 08:02:45 -0500
X-IronPort-AV: E=Sophos;i="4.69,596,1315180800"; 
   d="scan'208";a="9206561"
Received: from lonpmailmx01.citrite.net ([10.30.203.162])
	by LONPIPO01.EU.CITRIX.COM with ESMTP/TLS/RC4-MD5;
	30 Nov 2011 13:02:43 +0000
Received: from kaball.uk.xensource.com (10.80.2.59) by
	LONPMAILMX01.citrite.net (10.30.203.162) with Microsoft SMTP Server id
	8.3.213.0; Wed, 30 Nov 2011 13:02:43 +0000
Date: Wed, 30 Nov 2011 13:03:39 +0000
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball-desktop
To: Stefan Hajnoczi <stefanha@gmail.com>
In-Reply-To: <CAJSP0QWaGrgZ5+xBckUwF+JRNmTY4rm4vnm9yo+0LZJtNWEx-g@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1111301227570.31179@kaball-desktop>
References: <4ED3F1C3.4060601@weilnetz.de>
	<1322606869-25865-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<1322606869-25865-2-git-send-email-mdroth@linux.vnet.ibm.com>
	<CAJSP0QWaGrgZ5+xBckUwF+JRNmTY4rm4vnm9yo+0LZJtNWEx-g@mail.gmail.com>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-112764079-1322656409=:31179"
Content-ID: <alpine.DEB.2.00.1111301236410.31179@kaball-desktop>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 62.200.22.115
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"sw@weilnetz.de" <sw@weilnetz.de>,
	Stefano Stabellini <Stefano.Stabellini@eu.citrix.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 2/2] Makefile: use full path for
 qapi-generated directory
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 13:02:52 -0000

--8323329-112764079-1322656409=:31179
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.00.1111301236411.31179@kaball-desktop>

On Wed, 30 Nov 2011, Stefan Hajnoczi wrote:
> On Tue, Nov 29, 2011 at 10:47 PM, Michael Roth
> <mdroth@linux.vnet.ibm.com> wrote:
> > Generally $(BUILD_DIR) == $(CURDIR), but that isn't necessarilly the
> > case, so use $(BUILD_DIR)/qapi-generated for generated files to
> > avoid potentionally sticking generating files in odd places outside
> > the build's include paths.
> > ---
> > Ã?Â Makefile | Ã?Â  Ã?Â 2 +-
> > Ã?Â 1 files changed, 1 insertions(+), 1 deletions(-)
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
> 
> Not applied to trivial tree yet.  I want to let Stefano, Stefan Weil,
> or Anthony take a look too since we were all discussing these changes
> yesterday.
 
While I think that the change is correct (certainly better than the
original patch), unfortunately still doesn't solve the problem
entirely.
Steps to repro, assuming "qemu" is the source tree and "temp" is the
empty build directory:

- cd qemu; ./configure; make

- cd ../temp; ./configure --source-path=../qemu; make

Result:

Makefile:9: config-devices.mak: No such file or directory

In order to fix the issue, we need to make sure that config-devices.mak
is relative to $(BUILD_DIR) in the Makefile.

Signed-off-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>

diff --git a/Makefile b/Makefile
index 301c75e..b9f8de7 100644
--- a/Makefile
+++ b/Makefile
@@ -43,15 +43,15 @@ DOCS=
 endif
 
 SUBDIR_MAKEFLAGS=$(if $(V),,--no-print-directory) BUILD_DIR=$(BUILD_DIR)
-SUBDIR_DEVICES_MAK=$(patsubst %, %/config-devices.mak, $(TARGET_DIRS))
-SUBDIR_DEVICES_MAK_DEP=$(patsubst %, %/config-devices.mak.d, $(TARGET_DIRS))
+SUBDIR_DEVICES_MAK=$(patsubst %, %/config-devices.mak, $(BUILD_DIR)/$(TARGET_DIRS))
+SUBDIR_DEVICES_MAK_DEP=$(patsubst %, %/config-devices.mak.d, $(BUILD_DIR)/$(TARGET_DIRS))
 
 config-all-devices.mak: $(SUBDIR_DEVICES_MAK)
 	$(call quiet-command,cat $(SUBDIR_DEVICES_MAK) | grep =y | sort -u > $@,"  GEN   $@")
 
 -include $(SUBDIR_DEVICES_MAK_DEP)
 
-%/config-devices.mak: default-configs/%.mak
+$(BUILD_DIR)/%/config-devices.mak: default-configs/%.mak
 	$(call quiet-command,$(SHELL) $(SRC_PATH)/scripts/make_device_config.sh $@ $<, "  GEN   $@")
 	@if test -f $@; then \
 	  if cmp -s $@.old $@; then \
--8323329-112764079-1322656409=:31179--

